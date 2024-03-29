import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:random_waifu/data/models/models.dart';
import 'package:random_waifu/ui/screens/collection/widgets/card_image.dart';
import 'package:random_waifu/ui/screens/detail/detail_page.dart';

import 'ad_builder.dart';

class CollectionLoaded extends StatefulWidget {
  final List<JsonWaifu> waifus;
  final NativeAd? ad;
  CollectionLoaded({
    Key? key,
    required this.waifus,
    this.ad,
  });

  @override
  _CollectionLoadedState createState() => _CollectionLoadedState();
}

class _CollectionLoadedState extends State<CollectionLoaded> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: GridView.builder(
            padding: EdgeInsets.all(10),
            itemCount: widget.waifus.length,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 150,
              childAspectRatio: 3 / 4,
              crossAxisSpacing: 15,
              mainAxisSpacing: 20,
            ),
            itemBuilder: (context, index) {
              final waifu = widget.waifus[index];

              return CardImage(
                imageUrl: waifu.imageUrl ?? "",
                title: waifu.title ?? "",
                subtitle:
                    waifu.anime != null ? waifu.anime?.name : waifu.manga?.name,
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(
                      waifu: waifu,
                      date: waifu.date,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        AdBuilder(ad: widget.ad)
      ],
    );
  }
}
