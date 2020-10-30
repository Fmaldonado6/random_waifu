import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:random_waifu/ui/widgets/CharacterInformation/CharacterImage.dart';
import 'package:random_waifu/ui/widgets/CharacterInformation/CharacterNameWidget.dart';

class CharacterInformationWidget extends StatelessWidget {
  final String imageUrl;
  final int malId;
  final String name;
  CharacterInformationWidget({Key key, this.name, this.imageUrl,this.malId})
      : super(key: key);

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
          imageUrl: imageUrl,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 5,
        ),
        CharacterNameWidget(
          name: name,
          malId: malId,
        ),
      ],
    );
  }
}
