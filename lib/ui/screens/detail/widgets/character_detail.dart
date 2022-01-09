import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:random_waifu/data/models/models.dart';
import 'package:random_waifu/ui/screens/detail/widgets/character_detail_info.dart';
import 'package:random_waifu/ui/widgets/rounded_image.dart';

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
      child: CharacterDetailInformation(
        characterInformation: characterInformation,
        date: date,
        adWidget: ad,
      ),
    );
  }
}
