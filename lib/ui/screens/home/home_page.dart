import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_waifu/app_config.dart';
import 'package:random_waifu/di/injection_config.dart';
import 'package:random_waifu/ui/screens/collection/collection_page.dart';
import 'package:random_waifu/ui/screens/home/cubit/home_cubit.dart';
import 'package:random_waifu/ui/screens/home/cubit/home_state.dart';
import 'package:random_waifu/ui/screens/home/widgets/character_information.dart';
import 'package:random_waifu/ui/widgets/confirm_dialog_widget.dart';
import 'package:random_waifu/ui/widgets/error_message.dart';
import 'package:random_waifu/ui/widgets/finish_dialog.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _homeCubit = getIt.get<HomeCubit>();

  @override
  void initState() {
    super.initState();
    this._homeCubit.init();
    this._homeCubit.loadAd(AppConfig().rewardedAd);
  }

  @override
  void dispose() {
    this._homeCubit.close();
    super.dispose();
  }

  void _launchURL() async {
    var url = Uri.parse('https://twitter.com/Fmaldonado4202');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void retry() {
    _homeCubit.getRandomWaifu();
  }

  @override
  Widget build(BuildContext context) {
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => CollectionPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: BlocProvider(
        create: (context) => _homeCubit,
        child: BlocConsumer<HomeCubit, HomeState>(
          bloc: _homeCubit,
          listener: (context, state) {
            if (state is HomeStateListFinish) {
              EndDialog().show(
                context: context,
                title: "Congratulations!",
                text:
                    "You have collected every waifu, thanks for downloading Random Waifu",
                confirm: "Restart",
                callback: () {
                  Navigator.pop(context);

                  ConfirmDialog().show(
                    context: context,
                    title: "Restart",
                    text:
                        "This will delete your current waifus from the local device and cloud, are you sure you want to continue?",
                    confirm: "I want to start over",
                    callback: () {
                      Navigator.pop(context);
                      _homeCubit.restart();
                    },
                  );
                },
              );
            }
          },
          builder: (context, state) {
            if (state is HomeStateLoading)
              return Center(
                  child: CircularProgressIndicator(
                backgroundColor: Colors.white,
              ));

            if (state is HomeStateLoaded)
              return Center(
                child: CharacterInformationWidget(
                  waifu: state.waifu,
                ),
              );

            return ErrorMessages(
              clickedFunction: retry,
            );
          },
        ),
      ),
    );
  }
}
