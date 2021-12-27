import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:injectable/injectable.dart';
import 'package:random_waifu/app_config.dart';
import 'package:random_waifu/data/mapping/mapping.dart';
import 'package:random_waifu/data/models/models.dart';
import 'package:random_waifu/data/network/auth_service/auth_service.dart';
import 'package:random_waifu/data/network/firebase/firebase_service.dart';
import 'package:random_waifu/data/preferences/preferences.dart';
import 'package:random_waifu/data/repositories/waifu_repository.dart';
import 'package:random_waifu/ui/screens/home/cubit/home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  WaifuRepository _waifuRepository;
  FirebaseService _firebaseService;
  AuthService _authService;
  Preferences _preferences;
  RewardedAd? _ad;

  HomeCubit(
    this._waifuRepository,
    this._preferences,
    this._authService,
    this._firebaseService,
  ) : super(HomeStateLoading());

  Future loadAd(String adId) async {
    await RewardedAd.load(
      adUnitId: adId,
      request: AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (RewardedAd ad) {
          this._ad = ad;
        },
        onAdFailedToLoad: (LoadAdError error) {
          print("Error loading ad $error");
        },
      ),
    );
    _ad?.fullScreenContentCallback = FullScreenContentCallback(
      onAdDismissedFullScreenContent: (RewardedAd ad) {
        print('$ad onAdDismissedFullScreenContent.');
        ad.dispose();
      },
      onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error) {
        ad.dispose();
      },
    );
  }

  void showAd() async {
    await this.loadAd(AppConfig().rewardedAd);
    _ad?.show(
      onUserEarnedReward: (RewardedAd ad, RewardItem item) async {
        final savedWaifus = await this._waifuRepository.localWaifus;

        await this._waifuRepository.removeWaifu(savedWaifus.length - 1);
        await this._waifuRepository.clearDay();
        this.getRandomWaifu();
      },
    );
  }

  Future init() async {
    await this._waifuRepository.init();
    await this._preferences.init();
    this.getRandomWaifu();
  }

  Future getRandomWaifu() async {
    emit(HomeStateLoading());

    try {
      bool shouldFetchWaifu = await shouldFetch();

      await _waifuRepository.updateWaifusInfo();

      final localWaifus = await _waifuRepository.localWaifus;
      final waifusList = await _waifuRepository.waifus;

      JsonWaifu? waifu = localWaifus.isEmpty ? null : localWaifus.last;

      if (true) {
        bool exists = true;

        while (exists) {
          final random = Random().nextInt(waifusList.length);
          waifu = waifusList[random];
          exists = await this._waifuRepository.characterExists(waifu.malId!);
        }

        await this._waifuRepository.addWaifu(waifu!);
        await this._waifuRepository.resetDay();
        await this._saveNewWaifu();
      }

      emit(HomeStateLoaded(waifu!));
    } catch (e) {
      emit(HomeStateError(e.toString()));
    }
  }

  Future _saveNewWaifu() async {
    try {
      if (!this._preferences.getAutoSave()) return;
      final savedUser = await this._authService.currentUser;

      if (savedUser == null) return;

      final savedCharacters = await _waifuRepository.localWaifus;

      final characterResource =
          Mapping.jsonWaifuListToSavedCharacterList(savedCharacters);

      _firebaseService.saveWaifus(characterResource, savedUser.uid);
    } catch (e) {
      print("Couldn't save waifu");
    }
  }

  Future<bool> shouldFetch() async {
    var lastWaifuDate = await this._waifuRepository.getLastWaifuDate();

    var today = DateTime.now();

    return today.day != lastWaifuDate && today.hour >= 0 ||
        lastWaifuDate == null;
  }
}
