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
  JsonWaifu? savedWaifu;
  NativeAd? ad;
  PictureStatus pictureStatus = PictureStatus.loading;
  DetailCubit(this._waifuRepository) : super(DetailStateLoading());

  void initAd(String adId) {
    final ad = NativeAd(
      adUnitId: adId,
      factoryId: "adFactory",
      request: AdRequest(),
      listener: NativeAdListener(
        onAdLoaded: (ad) {
          this.ad = ad as NativeAd?;
          emit(DetailStateLoaded(
            waifu!,
            pictureStatus,
            this.ad,
          ));
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
      this.savedWaifu = savedWaifu;
      waifu = await this._waifuRepository.getWaifuInfo(savedWaifu.malId!);
      waifu?.pictures = [];

      if (savedWaifu.imageUrl != waifu?.getWaifuImage()) {
        savedWaifu.imageUrl = waifu?.getWaifuImage() ?? savedWaifu.imageUrl;
        await this._waifuRepository.updateWaifuByValue(savedWaifu);
      }

      getWaifuImages();

      initAd(AppConfig().adId);
      emit(DetailStateLoaded(
        waifu!,
        pictureStatus,
        this.ad,
      ));
    } catch (e) {
      print(e);
      emit(DetailStateError(e.toString()));
    }
  }

  Future getWaifuImages() async {
    try {
      pictureStatus = PictureStatus.loading;
      emit(DetailStateLoaded(
        waifu!,
        pictureStatus,
        this.ad,
      ));

      waifu?.pictures =
          await this._waifuRepository.getWaifuPictures(savedWaifu!.malId!);

      if (waifu?.pictures?.length == 0)
        pictureStatus = PictureStatus.empty;
      else
        pictureStatus = PictureStatus.loaded;

      emit(DetailStateLoaded(
        waifu!,
        pictureStatus,
        this.ad,
      ));
    } catch (e) {
      print(e);
      pictureStatus = PictureStatus.error;
      emit(DetailStateLoaded(
        waifu!,
        pictureStatus,
        this.ad,
      ));
    }
  }

  void dispose() {
    ad?.dispose();
  }
}
