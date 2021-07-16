import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_waifu/screens/detail/cubit/detail_cubit.dart';
import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:random_waifu/screens/detail/cubit/detail_state.dart';
import 'package:random_waifu/screens/detail/widgets/character_detail.dart';
import 'package:random_waifu/widgets/error_message.dart';

class DetailPage extends StatefulWidget {
  final int characterId;
  final String? date;
  DetailPage({
    Key? key,
    required this.characterId,
    this.date,
  }) : super(key: key);

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
        child: BlocBuilder<DetailCubit, DetailState>(
          bloc: _detailBloc,
          builder: (context, DetailState state) {
            if (state is DetailStateLoading)
              return Center(
                child: CircularProgressIndicator(),
              );

            if (state is DetailStateLoaded)
              return CharacterDetail(
                characterInformation: state.waifu,
                date: widget.date,
                ad: state.adWidget,
              );

            return ErrorMessages(
              clickedFunction: () =>
                  _detailBloc.getWaifuInformation(widget.characterId),
            );
          },
        ),
      ),
    );
  }
}
