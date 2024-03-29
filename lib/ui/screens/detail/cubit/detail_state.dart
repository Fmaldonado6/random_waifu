import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:random_waifu/data/models/models.dart';

abstract class DetailState {
  const DetailState();
}

class DetailStateLoading extends DetailState {
  const DetailStateLoading();
}

class DetailStateLoaded extends DetailState {
  final Waifu waifu;
  final PictureStatus pictureStatus;
  final NativeAd? adWidget;
  const DetailStateLoaded(
    this.waifu,
    this.pictureStatus,
    this.adWidget,
  );
}

class DetailStateError extends DetailState {
  final String error;

  const DetailStateError(this.error);
}

enum PictureStatus{
  loading,
  loaded,
  error,
  empty
}