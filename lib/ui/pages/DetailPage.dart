import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:random_waifu/ui/bloc/DetailBloc/DetailCubit.dart';
import 'package:random_waifu/ui/bloc/DetailBloc/DetailState.dart';
import 'package:random_waifu/ui/widgets/CharacterDetail/CharacterDetail.dart';
import 'package:random_waifu/ui/widgets/ErrorMessages/ErrorMessages.dart';

class DetailPage extends StatefulWidget {
  final int characterId;

  DetailPage({Key key, this.characterId}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final _detailBloc = kiwi.KiwiContainer().resolve<DetailCubit>();

  @override
  void initState() {
    _detailBloc.getWaifuInformation(widget.characterId);
    super.initState();
  }

  @override
  void dispose() {
    _detailBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
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
        child: BlocBuilder(
          cubit: _detailBloc,
          builder: (context, DetailState state) {
            if (state is DetailStateLoading)
              return Center(
                child: CircularProgressIndicator(),
              );

            if (state is DetailStateLoaded)
              return CharacterDetail(
                characterInformation: state.waifu,
              );

            return ErrorMessages(
              clickedFunction: retry,
            );
          },
        ),
      ),
    );
  }

  void retry() {
    _detailBloc.getWaifuInformation(widget.characterId);
  }
}
