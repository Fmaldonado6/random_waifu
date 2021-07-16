import 'package:bloc/bloc.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:random_waifu/app_config.dart';
import 'package:random_waifu/models/models.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:random_waifu/ui/screens/home/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final WaifusService waifusService;
  final PushNotificationService pushNotificationService;
  final DatabaseRepository _databaseRepository;

  RewardedAd? _ad;

  HomeCubit(
    this.waifusService,
    this._databaseRepository,
    this.pushNotificationService,
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
        await this._databaseRepository.deleteLastWaifu();
        this.getRandomWaifu();
      },
    );
  }

  Future initApp() async {
    emit(HomeStateLoading());

    try {
      await _databaseRepository.init();
      this.getRandomWaifu();
    } catch (e) {
      print(e);
      emit(HomeStateError(e.toString()));
    }
  }

  Future getRandomWaifu() async {
    emit(HomeStateLoading());

    try {
      var lastWaifuDate = this._databaseRepository.getLastWaifuDate();

      var today = DateTime.now();

      JsonWaifu waifu;

      bool shouldFetchWaifu = today.day != lastWaifuDate && today.hour >= 0 ||
          lastWaifuDate == null;

      if (shouldFetchWaifu) {
        do {
          waifu = await this.waifusService.getRandomWaifu();
        } while (await this._databaseRepository.characterExists(waifu.mal_id!));
        final newCharacter = SavedCharacter(
            characterId: waifu.mal_id,
            date: _getDate(),
            imageUrl: waifu.image_url,
            name: waifu.title,
            anime: waifu.anime,
            manga: waifu.manga);

        await this._databaseRepository.addWaifu(newCharacter);
        await this._databaseRepository.resetTimer();
      } else
        waifu = this._databaseRepository.loadLastWaifu();

      if (waifu.anime == null && waifu.manga == null)
        waifu = await updateWaifus();

      emit(HomeStateLoaded(waifu));
    } catch (e) {
      print(e);
      emit(HomeStateError(e.toString()));
    }
  }

  Future<JsonWaifu> updateWaifus() async {
    final waifus = Map<int, JsonWaifu>.fromIterable(
      await waifusService.getWaifusList(),
      key: (e) => e.mal_id,
    );

    final savedWaifus = _databaseRepository.getCharacters();
    SavedCharacter savedWaifu = SavedCharacter();
    int pos = 0;
    savedWaifus.values.forEach((element) async {
      final waifu = element as SavedCharacter;

      savedWaifu = SavedCharacter(
        characterId: waifu.characterId,
        date: waifu.date,
        imageUrl: waifu.imageUrl,
        manga: waifus[waifu.characterId]?.manga,
        anime: waifus[waifu.characterId]?.anime,
        name: waifu.name,
      );

      await _databaseRepository.updateWaifu(savedWaifu, pos++);

    });
    
    return JsonWaifu(
      anime: savedWaifu.anime,
      image_url: savedWaifu.imageUrl,
      mal_id: savedWaifu.characterId,
      manga: savedWaifu.manga,
      title: savedWaifu.name,
    );
  }

  String _getDate() {
    return "${DateTime.now().day} / ${DateTime.now().month} / ${DateTime.now().year}";
  }
}
