import 'package:bloc/bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:injectable/injectable.dart';
import 'package:random_waifu/app_config.dart';
import 'package:random_waifu/data/models/models.dart';
import 'package:random_waifu/data/repositories/waifu_repository.dart';

import 'detail_state.dart';

@injectable
class DetailCubit extends Cubit<DetailState> {
  final WaifuRepository _waifuRepository;
  Waifu? waifu;
  DetailCubit(this._waifuRepository) : super(DetailStateLoading());

  void initAd(String adId) {
    final ad = NativeAd(
      adUnitId: adId,
      factoryId: "adFactory",
      request: AdRequest(),
      listener: NativeAdListener(
        onAdLoaded: (ad) {
          emit(DetailStateLoaded(waifu!, ad as NativeAd));
        },
      ),
      nativeTemplateStyle: NativeTemplateStyle(
        templateType: TemplateType.medium,
      ),
    );

    ad.load();
  }

  Future getWaifuInformation(JsonWaifu savedWaifu) async {
    emit(DetailStateLoading());
    try {
      waifu = await this._waifuRepository.getWaifuInfo(savedWaifu.malId!);

      if (savedWaifu.imageUrl != waifu?.getWaifuImage()) {
        savedWaifu.imageUrl = waifu?.getWaifuImage() ?? savedWaifu.imageUrl;
        await this._waifuRepository.updateWaifuByValue(savedWaifu);
      }
    } catch (e) {
      print(e);
      emit(DetailStateError(e.toString()));
      return;
    }

    try {
      Future.delayed(Duration(seconds: 1));
      waifu?.pictures =
          await this._waifuRepository.getWaifuPictures(savedWaifu.malId!);
    } catch (e) {
      print(e);
    }

    initAd(AppConfig().adId);
    emit(DetailStateLoaded(waifu!, null));
  }
}
