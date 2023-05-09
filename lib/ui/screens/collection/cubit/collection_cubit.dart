import 'dart:collection';

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
  List<JsonWaifu> _sortedWaifus = [];
  List<List<JsonWaifu>> _waifusByAnimeList = [];
  ScrollController? scrollController;
  NativeAd? ad;
  SortType sortType = SortType.Acending;
  CollectionCubit(this._waifuRepository) : super(CollectionStateLoading());
  int totalWaifus = 0;

  void initAd(String adId) {
    final ad = NativeAd(
      adUnitId: adId,
      factoryId: "adFactory",
      request: AdRequest(),
      
      nativeTemplateStyle: NativeTemplateStyle(
    
        templateType: TemplateType.small,
        
        primaryTextStyle: NativeTemplateTextStyle(size: 12),
        secondaryTextStyle: NativeTemplateTextStyle(size: 12),
        tertiaryTextStyle: NativeTemplateTextStyle(size: 12),
        callToActionTextStyle: NativeTemplateTextStyle(
          size: 12,
        ),
      ),
      listener: NativeAdListener(
        onAdLoaded: (ad) {
          this.ad = ad as NativeAd;
          if (!this.isClosed)
            emit(CollectionStateLoaded(
              waifus: _sortedWaifus,
              waifusByAnime: _waifusByAnimeList,
              totalWaifus: totalWaifus,
              ad: this.ad,
              sortType: this.sortType,
            ));
        },
      ),
    );

    ad.load();
  }

  getCollection() async {
    try {
      if (!this.isClosed) emit(CollectionStateLoading());
      savedWaifus = await this._waifuRepository.localWaifus;
      _sortedWaifus = savedWaifus;
      totalWaifus = _waifuRepository.totalWaifus;
      if (savedWaifus.length > totalWaifus)
        totalWaifus += savedWaifus.length - totalWaifus;
      this.initAd(AppConfig().adId);
      if (!this.isClosed)
        emit(CollectionStateLoaded(
          waifus: _sortedWaifus,
          totalWaifus: totalWaifus,
          waifusByAnime: _waifusByAnimeList,
          ad: this.ad,
          sortType: this.sortType,
        ));
    } catch (e) {
      if (!this.isClosed) emit(CollectionStateError(e.toString()));
    }
  }

  void sort(SortType sortType) {
    this.sortType = sortType;

    _sortedWaifus = [...savedWaifus];

    if (sortType == SortType.Acending) _sortedWaifus = savedWaifus;

    if (sortType == SortType.Descending)
      _sortedWaifus = savedWaifus.reversed.toList();

    if (sortType == SortType.Anime) {
      final waifusWithoutAnime = <JsonWaifu>[];

      final waifusByAnime = SplayTreeMap<String?, List<JsonWaifu>>();

      for (var waifu in _sortedWaifus) {
        if (waifu.getName() == null) {
          waifusWithoutAnime.add(waifu);
          continue;
        }

        final exists = waifusByAnime[waifu.getName()];

        if (exists == null)
          waifusByAnime[waifu.getName()] = [waifu];
        else
          exists.add(waifu);
      }

      _waifusByAnimeList = waifusByAnime.values.toList();

      if (waifusWithoutAnime.length > 0)
        _waifusByAnimeList.addAll([waifusWithoutAnime]);
    }

    ad?.dispose();
    ad = null;
    initAd(AppConfig().adId);

    if (!this.isClosed)
      emit(CollectionStateLoaded(
        waifus: _sortedWaifus,
        totalWaifus: totalWaifus,
        waifusByAnime: _waifusByAnimeList,
        ad: this.ad,
        sortType: this.sortType,
      ));
  }

  void invertList() {
    savedWaifus = savedWaifus.reversed.toList();

    if (!this.isClosed)
      emit(CollectionStateLoaded(
        waifus: _sortedWaifus,
        waifusByAnime: _waifusByAnimeList,
        totalWaifus: totalWaifus,
        ad: this.ad,
        sortType: this.sortType,
      ));
  }

  void dispose() {
    ad?.dispose();
  }
}
