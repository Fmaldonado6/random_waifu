import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:random_waifu/models/models.dart';
import 'package:random_waifu/screens/detail/widgets/character_detail_info.dart';
import 'package:random_waifu/widgets/rounded_image.dart';

class CharacterDetail extends StatelessWidget {
  final Waifu characterInformation;
  final String? date;
  final NativeAd? ad;
  CharacterDetail({
    Key? key,
    required this.characterInformation,
    this.date,
    this.ad,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          RoundedImage(
            imageUrl: characterInformation.image_url ?? "",
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 20),
              child: Text(
                characterInformation.name ?? "",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Divider(),
          CharacterDetailInformation(
            characterInformation: characterInformation,
            date: date,
            adWidget: ad,
          ),
        ],
      ),
    );
  }
}
