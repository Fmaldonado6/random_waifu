import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:random_waifu/ui/bloc/InformationBloc/InformationCubit.dart';
import 'package:random_waifu/ui/bloc/InformationBloc/InformationState.dart';
import 'package:random_waifu/ui/pages/HistoryPage.dart';
import 'package:random_waifu/ui/widgets/CharacterInformation/CharacterInformationWidget.dart';
import 'package:random_waifu/ui/widgets/ErrorMessages/ErrorMessages.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _informationBloc = kiwi.KiwiContainer().resolve<InformationCubit>();

  @override
  void initState() {
    super.initState();
    _informationBloc.getRandomWaifu();
  }

  @override
  void dispose() {
    super.dispose();
    _informationBloc.close();
  }

  _launchURL() async {
    const url = 'https://twitter.com/Fmaldonado4202';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _informationBloc,
      child: _buildScaffold(),
    );
  }

  Scaffold _buildScaffold() {
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Random Waifu",
          style: TextStyle(fontSize: 25),
        ),
        leading: IconButton(
          icon: Icon(EvaIcons.twitter),
          onPressed: _launchURL,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.collections_bookmark),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (_) {
                  return HistoryPage();
                },
              ));
            },
          ),
        ],
      ),
      body: BlocBuilder(
        cubit: _informationBloc,
        builder: (context, InformationState state) {
          if (state is InformationStateLoading)
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
              ),
            );

          if (state is InformationStateLoaded) {
            return Center(
              child: CharacterInformationWidget(
                imageUrl: state.waifu.image_url,
                name: state.waifu.title,
                malId: state.waifu.mal_id,
              ),
            );
          }

          return ErrorMessages(
            clickedFunction: retry,
          );
        },
      ),
    );
  }

  void retry() {
    _informationBloc.getRandomWaifu();
  }
}
