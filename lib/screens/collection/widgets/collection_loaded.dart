import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_waifu/screens/collection/cubit/collection_cubit.dart';

class CollectionLoaded extends StatefulWidget {
  final List<Widget> waifus;
  const CollectionLoaded({Key key, this.waifus}) : super(key: key);

  @override
  _CollectionLoadedState createState() => _CollectionLoadedState();
}

class _CollectionLoadedState extends State<CollectionLoaded> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<CollectionCubit>().setScrollController(_scrollController);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    context.read<CollectionCubit>().diposeElements();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: _scrollController,
      children: widget.waifus,
    );
  }
}
