import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';
import 'package:flutter_native_admob/native_admob_controller.dart';
import 'package:hive/hive.dart';
import 'package:random_waifu/models/models.dart';
import 'package:random_waifu/repositories/local_database_repository.dart';
import 'package:random_waifu/screens/collection/cubit/collection_state.dart';
import 'package:random_waifu/screens/collection/widgets/waifu_list_item.dart';

class CollectionCubit extends Cubit<CollectionState> {
  DatabaseRepository _databaseRepository;

  Box<dynamic> savedWaifus;
  ScrollController scrollController;
  final _controller = NativeAdmobController();
  var _adUnitID = "ca-app-pub-4382391968703736/3980387355";
  StreamSubscription _subscription;
  double _adHeigt = 0;
  int currentCharacters = 0;
  bool _canFetch = true;
  bool _adLoaded = false;

  CollectionCubit(this._databaseRepository) : super(CollectionStateLoading());

  getCollection() {
    emit(CollectionStateLoading());
    savedWaifus = this._databaseRepository.getCharacters();
    this.currentCharacters = 0;
    _subscription = _controller.stateChanged.listen(_onStateChanged);

    loadMore();
  }

  diposeElements() {
    _controller.dispose();
    _subscription.cancel();
    scrollController.removeListener(scrollListener);
    scrollController.dispose();
  }

  void _onStateChanged(AdLoadState state) {
    switch (state) {
      case AdLoadState.loading:
        _adHeigt = 0;
        break;

      case AdLoadState.loadCompleted:
        _adHeigt = 100;
        if (_adLoaded) break;
        final list = getWidgetList();
        emit(CollectionStateLoaded(list));
        break;

      default:
        break;
    }
  }

  loadMore() {
    if (savedWaifus.length == currentCharacters) return;

    if (currentCharacters + 12 < savedWaifus.length)
      currentCharacters += 12;
    else
      currentCharacters = savedWaifus.length;

    final list = getWidgetList();
    emit(CollectionStateLoaded(list));
    _canFetch = true;
  }

  void setScrollController(ScrollController controller) {
    this.scrollController = controller;
    scrollController.addListener(scrollListener);
  }

  void scrollListener() {
    if (scrollController.position.extentAfter == 0 && _canFetch) {
      _canFetch = false;
      loadMore();
    }
  }

  List<Widget> getWidgetList() {
    final list = List<Widget>();
    for (var i = 0; i < currentCharacters; i++) {
      list.add(WaifuListItem(waifu: savedWaifus.getAt(i)));
      if (i % 5 == 0 && i != 0) list.add(getAd());
    }
    return list;
  }

  getAd() {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.only(bottom: _adHeigt == 0 ? 0 : 10),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: _adHeigt == 0
                      ? Colors.transparent
                      : Colors.grey.shade300))),
      width: double.infinity,
      height: _adHeigt,
      child: NativeAdmob(
        adUnitID: _adUnitID,
        controller: _controller,
        type: NativeAdmobType.full,
        loading: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
