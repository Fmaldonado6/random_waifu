import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_waifu/screens/collection/cubit/collection_cubit.dart';
import 'package:random_waifu/screens/collection/cubit/collection_state.dart';
import 'package:random_waifu/screens/collection/widgets/collection_loaded.dart';
import 'package:kiwi/kiwi.dart' as kiwi;

class CollectionPage extends StatefulWidget {
  CollectionPage({Key key}) : super(key: key);

  @override
  _CollectionPageState createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
  final _collectionCubit = kiwi.KiwiContainer().resolve<CollectionCubit>();

  @override
  void initState() {
    super.initState();
    _collectionCubit.getCollection();
  }

  @override
  void dispose() {
    _collectionCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Collection",
          style: TextStyle(fontSize: 25),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
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
          child: BlocBuilder<CollectionCubit, CollectionState>(
            cubit: _collectionCubit,
            builder: (context, state) {
              if (state is CollectionStateLoading)
                return Center(
                    child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                ));

              if (state is CollectionStateLoaded)
                return CollectionLoaded(waifus: state.waifus);

              return Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}