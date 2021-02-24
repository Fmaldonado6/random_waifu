import 'package:random_waifu/data/models/models.dart';

abstract class InformationState {
  const InformationState();
}

class InformationStateLoading extends InformationState {
  const InformationStateLoading();
}

class InformationStateLoaded extends InformationState {
  final JsonWaifu waifu;
  const InformationStateLoaded(this.waifu);
}

class InformationStateError extends InformationState {
  final String error;

  const InformationStateError(this.error);
}
