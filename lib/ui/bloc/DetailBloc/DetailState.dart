library DetailState;


import 'package:built_value/built_value.dart';
import 'package:random_waifu/data/models/ApiModels/CharacterInformation.dart';

part 'DetailState.g.dart';

abstract class DetailState implements Built<DetailState, DetailStateBuilder> {
  bool get isLoading;
  bool get hasError;
  CharacterInformation get characterInformation;

  DetailState._();

  factory DetailState([updates(DetailStateBuilder b)]) = _$DetailState;

  factory DetailState.loading() {
    return new DetailState((b) => b
      ..isLoading = true
      ..hasError = false
      ..characterInformation = null);
  }

  factory DetailState.error() {
    return DetailState((b) => b
      ..isLoading = false
      ..hasError = true
      ..characterInformation=null);
  }

  factory DetailState.success(CharacterInformation characterInformation) {
    return DetailState((b) => b
      ..isLoading = false
      ..hasError = false
      ..characterInformation.replace(characterInformation));
  }
}
