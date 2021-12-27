import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:random_waifu/data/mapping/mapping.dart';
import 'package:random_waifu/data/network/auth_service/auth_service.dart';
import 'package:random_waifu/data/network/firebase/firebase_service.dart';
import 'package:random_waifu/data/preferences/preferences.dart';
import 'package:random_waifu/data/repositories/waifu_repository.dart';
import 'package:random_waifu/ui/screens/cloud/cubit/cloud_state.dart';

@injectable
class CloudCubit extends Cubit<CloudState> {
  final AuthService _authService;
  final FirebaseService _databaseService;
  final WaifuRepository _waifuRepository;
  final Preferences _preferences;
  User? _userInformation;
  bool _autoSave = true;
  CloudCubit(
    this._authService,
    this._databaseService,
    this._waifuRepository,
    this._preferences,
  ) : super(CloudStateInitial());

  Future<void> init() async {
    try {
      emit(CloudStateLogin());

      _userInformation = await _authService.currentUser;
      _autoSave = _preferences.getAutoSave();

      if (_userInformation == null) return emit(CloudStateInitial());

      emit(CloudStateCompleted(_userInformation, _autoSave));
    } catch (e) {
      print(e);
      emit(CloudStateError("Error $e"));
    }
  }

  Future<bool> saveWaifus(String id) async {
    try {
      final savedCharacters = await _waifuRepository.localWaifus;

      final characterResource =
          Mapping.jsonWaifuListToSavedCharacterList(savedCharacters);

      _databaseService.saveWaifus(characterResource, id);

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> loadWaifus(String id) async {
    try {
      var characters = await _databaseService.loadWaifus(id);
      var lastWaifu = (await this._waifuRepository.localWaifus).last;

      if (characters.last.characterId != lastWaifu.malId) {
        var newCharacter = Mapping.jsonWaifuToSavedCharacter(lastWaifu);
        characters.add(newCharacter);
      }

      await _waifuRepository.clearWaifu();

      for (var waifu in characters) {
        await this._waifuRepository.addWaifu(
              Mapping.savedWaifuToJsonWaifu(waifu),
            );
      }

      _waifuRepository.updateWaifusInfo();

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<void> signOut() async {
    try {
      emit(CloudStateLogin());

      await _authService.signOut();

      emit(CloudStateInitial());
    } catch (e) {
      emit(CloudStateError("Error $e"));
    }
  }

  Future setAutoSave() async {
    _autoSave = !_autoSave;
    await this._preferences.setAutoSave(_autoSave);
    emit(CloudStateCompleted(_userInformation, _autoSave));
  }

  Future<void> login() async {
    try {
      emit(CloudStateLogin());

      _userInformation = await _authService.signInGoogle();

      _autoSave = _preferences.getAutoSave();

      emit(CloudStateCompleted(_userInformation, _autoSave));
    } catch (e) {
      print(e);

      emit(CloudStateError("Error $e"));
    }
  }
}
