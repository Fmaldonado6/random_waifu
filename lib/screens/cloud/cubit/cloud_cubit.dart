import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_waifu/models/models.dart';
import 'package:random_waifu/repositories/local_database_repository.dart';
import 'package:random_waifu/screens/cloud/cubit/cloud_state.dart';
import 'package:random_waifu/services/auth_service.dart';
import 'package:random_waifu/services/database_service.dart';

class CloudCubit extends Cubit<CloudState> {
  final AuthService _authService;
  final DatabaseService _databaseService;
  final DatabaseRepository _databaseRepository;
  CloudCubit(this._authService, this._databaseService, this._databaseRepository)
      : super(CloudStateInitial());

  Future<void> init() async {
    try {
      emit(CloudStateLogin());

      final userInformation = await _authService.currentUser;

      if (userInformation == null) return emit(CloudStateInitial());

      emit(CloudStateCompleted(userInformation));
    } catch (e) {
      print(e);
      emit(CloudStateError("Error $e"));
    }
  }

  Future<bool> saveWaifus(String id) async {
    try {
      var savedCharacters = _databaseRepository.getCharacters();

      var characters = <SavedCharacter>[];

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
      var lastWaifu = this._databaseRepository.loadLastWaifu();

      if (characters.waifus?.last.characterId != lastWaifu.mal_id) {
        var newCharacter = SavedCharacter(
          characterId: lastWaifu.mal_id,
          imageUrl: lastWaifu.image_url,
          name: lastWaifu.title,
        );
        characters.waifus?.add(newCharacter);
      }

      await _databaseRepository.clearCharacters();

      if (characters.waifus != null)
        await this._databaseRepository.addWaifuList(characters.waifus!);

      return true;
    } catch (e) {
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

  Future<void> login() async {
    try {
      emit(CloudStateLogin());

      final userInformation = await _authService.signInGoogle();

      print(userInformation);

      emit(CloudStateCompleted(userInformation));
    } catch (e) {
      print(e);

      emit(CloudStateError("Error $e"));
    }
  }
}
