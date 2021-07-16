
import 'package:random_waifu/data/models/models.dart';

abstract class HomeState {
  const HomeState();
}

class HomeStateLoading extends HomeState {
  const HomeStateLoading();
}

class HomeStateLoaded extends HomeState {
  final JsonWaifu waifu;
  const HomeStateLoaded(this.waifu);
}

class HomeStateError extends HomeState {
  final String error;

  const HomeStateError(this.error);
}
