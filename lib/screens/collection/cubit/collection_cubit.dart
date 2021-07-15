import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hive/hive.dart';
import 'package:random_waifu/app_config.dart';
import 'package:random_waifu/repositories/local_database_repository.dart';
import 'package:random_waifu/screens/collection/cubit/collection_state.dart';

class CollectionCubit extends Cubit<CollectionState> {
  DatabaseRepository _databaseRepository;
  Box<dynamic> savedWaifus;
  ScrollController scrollController;

  CollectionCubit(this._databaseRepository) : super(CollectionStateLoading());

  void initAd(String adId) {
    final ad = NativeAd(
      adUnitId: adId,
      factoryId: "",
      request: AdRequest(),
      listener: NativeAdListener(
        onAdLoaded: (ad) {
          emit(CollectionStateLoaded(savedWaifus, ad));
        },
      ),
    );

    ad.load();
  }

  getCollection() {
    try {
      emit(CollectionStateLoading());
      savedWaifus = this._databaseRepository.getCharacters();
      this.initAd(AppConfig().adId);
      emit(CollectionStateLoaded(savedWaifus, null));
    } catch (e) {
      emit(CollectionStateError(e.toString()));
    }
  }
}
