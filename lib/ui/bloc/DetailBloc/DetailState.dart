import 'package:random_waifu/data/models/models.dart';

abstract class DetailState {
  const DetailState();
}

class DetailStateLoading extends DetailState {
  const DetailStateLoading();
}

class DetailStateLoaded extends DetailState {
  final Waifu waifu;
  const DetailStateLoaded(this.waifu);
}

class DetailStateError extends DetailState {
  final String error;

  const DetailStateError(this.error);
}
