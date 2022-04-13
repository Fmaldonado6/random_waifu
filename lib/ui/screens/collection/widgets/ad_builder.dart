import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdBuilder extends StatelessWidget {
  final NativeAd? ad;
  const AdBuilder({
    Key? key,
    required this.ad,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) => Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: ad == null ? Colors.transparent : Colors.grey.shade200,
            ),
          ),
        ),
        width: double.infinity,
        height: ad != null ? 75 : 0,
        child: ad != null
            ? AdWidget(
                ad: ad!,
              )
            : Container(),
      ),
    );
  }
}
