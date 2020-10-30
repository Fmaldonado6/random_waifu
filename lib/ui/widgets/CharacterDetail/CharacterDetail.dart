import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:random_waifu/data/models/ApiModels/CharacterInformation.dart';
import 'package:random_waifu/ui/widgets/CharacterDetail/CharacterDetailImage.dart';
import 'package:random_waifu/ui/widgets/CharacterDetail/CharacterDetailInformation.dart';

class CharacterDetail extends StatelessWidget {
  final CharacterInformation characterInformation;
  CharacterDetail({Key key, this.characterInformation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          CharacterDetailImage(
            imageUrl: characterInformation.image_url,
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 20),
              child: Text(
                characterInformation.name,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Divider(),
          CharacterDetailInformation(
            characterInformation: characterInformation,
          )
        ],
      ),
    );
  }
}
