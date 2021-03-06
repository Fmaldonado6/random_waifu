import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:injectable/injectable.dart';
import 'package:random_waifu/app_config.dart';
import 'package:random_waifu/data/models/models.dart';
import 'package:random_waifu/data/repositories/waifu_repository.dart';
import 'package:random_waifu/ui/screens/collection/cubit/collection_state.dart';

@injectable
class CollectionCubit extends Cubit<CollectionState> {
  final WaifuRepository _waifuRepository;
  List<JsonWaifu> savedWaifus = [];
  ScrollController? scrollController;
  NativeAd? ad;
  CollectionCubit(this._waifuRepository) : super(CollectionStateLoading());

  void initAd(String adId) {
    final ad = NativeAd(
      adUnitId: adId,
      factoryId: "adFactory",
      request: AdRequest(),
      listener: NativeAdListener(
        onAdLoaded: (ad) {
          this.ad = ad as NativeAd;
          emit(CollectionStateLoaded(savedWaifus, this.ad));
        },
      ),
    );

    ad.load();
  }

  getCollection() async {
    try {
      emit(CollectionStateLoading());
      savedWaifus = await this._waifuRepository.localWaifus;
      this.initAd(AppConfig().adId);
      emit(CollectionStateLoaded(savedWaifus, null));
    } catch (e) {
      emit(CollectionStateError(e.toString()));
    }
  }

  void invertList() {
    savedWaifus = savedWaifus.reversed.toList();
    print(savedWaifus.reversed);
    emit(CollectionStateLoaded(savedWaifus, this.ad));
  }
}
