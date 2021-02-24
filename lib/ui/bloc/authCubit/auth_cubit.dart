import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:random_waifu/data/models/models.dart';
import 'package:random_waifu/services/AuthService.dart';
import 'package:random_waifu/services/DatabaseService.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthService _authService;
  final DatabaseService _databaseService;

  AuthCubit(this._authService, this._databaseService)
      : super(AuthStateInitial());

  Future<void> init() async {
    try {
      emit(AuthStateLogin());

      final userInformation = await _authService.currentUser;

      if (userInformation == null) return emit(AuthStateInitial());
      print(userInformation);

      emit(AuthStateCompleted(userInformation));
    } catch (e) {
      print(e);
      emit(AuthStateError("Error $e"));
    }
  }

  Future<bool> saveWaifus(String id) async {
    try {
      var savedCharacters = Hive.box('savedCharacters');

      var characters = List<SavedCharacter>();

      for (var i = 0; i < savedCharacters.length; i++) {
        characters.add(savedCharacters.getAt(i));
      }
      _databaseService.saveWaifus(characters, id);

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> loadWaifus(String id) async {
    try {
      var characters = await _databaseService.loadWaifus(id);
      await Hive.box('savedCharacters').clear();
      await Hive.box('savedCharacters').addAll(characters.waifus);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> signOut() async {
    try {
      emit(AuthStateLogin());

      await _authService.signOut();

      emit(AuthStateInitial());
    } catch (e) {
      emit(AuthStateError("Error $e"));
    }
  }

  Future<void> login() async {
    try {
      emit(AuthStateLogin());

      final userInformation = await _authService.signInGoogle();

      print(userInformation);

      emit(AuthStateCompleted(userInformation));
    } catch (e) {
      print(e);

      emit(AuthStateError("Error $e"));
    }
  }
}
