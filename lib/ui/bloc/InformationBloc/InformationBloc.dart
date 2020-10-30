import 'package:bloc/bloc.dart';
import 'package:random_waifu/data/models/ApiModels/SavedCharacter.dart';
import 'package:random_waifu/data/models/errors/JikanSearchError.dart';
import 'package:hive/hive.dart';
import 'package:random_waifu/data/models/errors/KitsuSearchError.dart';
import 'package:random_waifu/data/repositories/KitsuRepository.dart';

import 'InformationEvent.dart';
import 'InformationState.dart';

class InformationBloc extends Bloc<InformationEvent, InformationState> {
  final KitsuRepository _kitsuRepository;

  InformationBloc(InformationState initialState, this._kitsuRepository)
      : super(initialState);

  void getRandomWaifu() {
    add(GetWaifu());
  }

  @override
  Stream<InformationState> mapEventToState(InformationEvent event) async* {
    if (event is GetWaifu) {
      try {
        yield InformationState.loading();
        final characterInformation = await _kitsuRepository.getRandomWaifu();

        

        yield InformationState.success(characterInformation);
      } on KitsuSearchError catch (e) {
        print(e);
        yield InformationState.error();
      }
    }
  }
}
