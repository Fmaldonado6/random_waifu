import 'package:bloc/bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:random_waifu/app_config.dart';
import 'package:random_waifu/models/models.dart';
import 'package:random_waifu/screens/detail/cubit/detail_state.dart';
import 'package:random_waifu/services/jikan_service.dart';

class DetailCubit extends Cubit<DetailState> {
  final JikanService jikanService;
  Waifu? waifu;
  DetailCubit(this.jikanService) : super(DetailStateLoading());

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
    );

    ad.load();
  }

  Future getWaifuInformation(int malId) async {
    emit(DetailStateLoading());
    try {
      waifu = await this.jikanService.getCharacterInformation(malId);
      initAd(AppConfig().adId);
      emit(DetailStateLoaded(waifu!, null));
    } catch (e) {
      emit(DetailStateError(e.toString()));
    }
  }
}
