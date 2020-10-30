import 'package:bloc/bloc.dart';
import 'package:random_waifu/data/models/errors/JikanSearchError.dart';
import 'package:random_waifu/data/repositories/JikanRepository.dart';

import 'DetailEvent.dart';
import 'DetailState.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final JikanRepository _jikanRepository;

  DetailBloc(DetailState initialState, this._jikanRepository)
      : super(initialState);

  void getCharacterInformation(int characterId) {
    add(GetCharacterInformation(characterId));
  }

  @override
  Stream<DetailState> mapEventToState(DetailEvent event) async* {
    if (event is GetCharacterInformation) {
      try {
        yield DetailState.loading();
        var characterInformation =
            await _jikanRepository.getCharacterInformation(event.id);

        yield DetailState.success(characterInformation);
      } on JikanSearchError catch (_) {
        yield DetailState.error();
      } on JikanCharacterError catch (_) {
        yield DetailState.error();
      }
    }
  }
}
