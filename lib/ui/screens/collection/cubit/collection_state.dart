import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:random_waifu/data/models/models.dart';

abstract class CollectionState {
  const CollectionState();
}

class CollectionStateLoading extends CollectionState {
  const CollectionStateLoading();
}

class CollectionStateLoaded extends CollectionState {
  final List<JsonWaifu> waifus;
  final List<List<JsonWaifu>>? waifusByAnime;
  final NativeAd? ad;
  final SortType sortType;

  const CollectionStateLoaded({
    required this.waifus,
    required this.sortType,
    this.ad,
    this.waifusByAnime,
  });
}

class CollectionStateAdLoaded extends CollectionState {
  final adLoaded;
  const CollectionStateAdLoaded(this.adLoaded);
}

class CollectionStateError extends CollectionState {
  final String error;

  const CollectionStateError(this.error);
}

enum SortType { Acending, Descending, Anime }
