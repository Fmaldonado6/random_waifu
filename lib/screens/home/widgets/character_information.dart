import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_waifu/models/models.dart';
import 'package:random_waifu/screens/cloud/cloud_page.dart';
import 'package:random_waifu/screens/home/cubit/home_cubit.dart';
import 'package:random_waifu/screens/home/widgets/character_image.dart';
import 'package:random_waifu/screens/home/widgets/character_name.dart';
import 'package:random_waifu/widgets/confirm_dialog_widget.dart';

class CharacterInformationWidget extends StatelessWidget {
  final JsonWaifu waifu;
  CharacterInformationWidget({
    Key key,
    this.waifu,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).size.height / 15,
        ),
        CharacterImage(
          imageUrl: waifu.image_url,
        ),
        Container(
            margin: EdgeInsets.only(top: 30, bottom: 30),
            alignment: Alignment.topLeft,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.autorenew),
                  color: Colors.white,
                  onPressed: () => ConfirmDialog().show(
                    context: context,
                    title: "Change waifu",
                    confirm: "Watch",
                    text: "Watch an ad to change your todays' waifu!",
                    callback: () {
                      BlocProvider.of<HomeCubit>(context).showAd();
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.cloud),
                  color: Colors.white,
                  onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) {
                          return CloudPage();
                        },
                      ),
                    )
                  },
                ),
              ],
            )),
        CharacterNameWidget(
          name: waifu.title,
          malId: waifu.mal_id,
        ),
      ],
    );
  }
}
