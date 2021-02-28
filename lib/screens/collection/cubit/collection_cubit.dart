import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:random_waifu/repositories/local_database_repository.dart';
import 'package:random_waifu/screens/collection/cubit/collection_state.dart';

class CollectionCubit extends Cubit<CollectionState> {
  DatabaseRepository _databaseRepository;
  Box<dynamic> savedWaifus;
  ScrollController scrollController;

  CollectionCubit(this._databaseRepository) : super(CollectionStateLoading());

  getCollection() {
    try {
      emit(CollectionStateLoading());
      savedWaifus = this._databaseRepository.getCharacters();
      emit(CollectionStateLoaded(savedWaifus));
    } catch (e) {
      emit(CollectionStateError(e.toString()));
    }
  }
}
