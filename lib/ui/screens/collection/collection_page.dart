import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:random_waifu/di/injection_config.dart';
import 'package:random_waifu/ui/screens/collection/cubit/collection_cubit.dart';
import 'package:random_waifu/ui/screens/collection/cubit/collection_state.dart';
import 'package:random_waifu/ui/screens/collection/widgets/ad_builder.dart';
import 'package:random_waifu/ui/screens/collection/widgets/collection_appbar.dart';
import 'package:random_waifu/ui/screens/collection/widgets/collection_loaded_by_anime.dart';
import 'package:random_waifu/ui/widgets/error_message.dart';

import 'widgets/collection_loaded.dart';

class CollectionPage extends StatefulWidget {
  CollectionPage({Key? key}) : super(key: key);

  @override
  _CollectionPageState createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
  final _collectionCubit = getIt.get<CollectionCubit>();
  int totalWaifus = 0;
  int collectedWaifus = 0;

  @override
  void initState() {
    super.initState();
    _collectionCubit.getCollection();
  }

  @override
  void dispose() {
    _collectionCubit.dispose();
    _collectionCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: CollectionAppbar(
        collectedWaifus: collectedWaifus,
        totalWaifus: totalWaifus,
        actions: [
          PopupMenuButton<SortType>(
            onSelected: (value) {
              _collectionCubit.sort(value);
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: SortType.Acending,
                child: Text("Ascending"),
              ),
              PopupMenuItem(
                value: SortType.Descending,
                child: Text("Descending"),
              ),
              PopupMenuItem(
                value: SortType.Anime,
                child: Text("By Anime"),
              ),
            ],
          )
        ],
        body: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.only(top: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 10.0,
              ),
            ],
          ),
          child: BlocProvider(
            create: (context) => _collectionCubit,
            child: BlocConsumer<CollectionCubit, CollectionState>(
              bloc: _collectionCubit,
              listener: (context, state) {
                if (state is CollectionStateLoaded) {
                  setState(() {
                    totalWaifus = state.totalWaifus;

                    collectedWaifus = state.waifus.length;
                  });
                }
              },
              builder: (context, state) {
                if (state is CollectionStateLoading)
                  return Center(
                      child: CircularProgressIndicator(
                    backgroundColor: Colors.white,
                  ));

                if (state is CollectionStateLoaded) {
                  return state.sortType == SortType.Anime
                      ? CollectionLoadedByAnime(
                          waifus: state.waifusByAnime!,
                          ad: state.ad,
                        )
                      : CollectionLoaded(
                          waifus: state.waifus,
                          ad: state.ad,
                        );
                }
                return ErrorMessages(
                  clickedFunction: this._collectionCubit.getCollection,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
