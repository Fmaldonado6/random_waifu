import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_waifu/data/models/models.dart';
import 'package:random_waifu/ui/screens/cloud/cloud_page.dart';
import 'package:random_waifu/ui/screens/home/cubit/home_cubit.dart';
import 'package:random_waifu/ui/screens/home/widgets/character_image.dart';
import 'package:random_waifu/ui/screens/home/widgets/character_name.dart';
import 'package:random_waifu/ui/screens/image_detail/image_detail.dart';
import 'package:random_waifu/ui/widgets/confirm_dialog_widget.dart';

class CharacterInformationWidget extends StatelessWidget {
  final JsonWaifu waifu;
  CharacterInformationWidget({
    Key? key,
    required this.waifu,
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
          imageUrl: waifu.imageUrl ?? "",
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ImageDetailPage(
                  title: waifu.title ?? "",
                  pictures: [waifu.imageUrl ?? ""],
                ),
              ),
            );
          },
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
                    text: "Watch an ad to change your today's waifu!",
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
          waifu: waifu,
        ),
      ],
    );
  }
}
