import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:random_waifu/data/models/models.dart';
import 'package:random_waifu/ui/screens/collection/widgets/card_image.dart';
import 'package:random_waifu/ui/screens/detail/detail_page.dart';

class CollectionLoadedByAnime extends StatefulWidget {
  final List<List<JsonWaifu>> waifus;
  final NativeAd? ad;
  CollectionLoadedByAnime({
    Key? key,
    required this.waifus,
    this.ad,
  });

  @override
  _CollectionLoadedByAnimeState createState() =>
      _CollectionLoadedByAnimeState();
}

class _CollectionLoadedByAnimeState extends State<CollectionLoadedByAnime> {
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
          child: ListView.builder(
            itemCount: widget.waifus.length,
            itemBuilder: (context, index) {
              final currentWaifus = widget.waifus[index];
              return Container(
                margin: EdgeInsets.all(15),
                child: PhysicalModel(
                  shadowColor:
                      Theme.of(context).colorScheme.primary.withAlpha(90),
                  elevation: 7,
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        subtitle: Text(
                          currentWaifus.first.getIsAnimeOrManga(),
                        ),
                        title: Text(
                          currentWaifus.first.getName() ?? "Unknown",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      GridView.builder(
                        padding: EdgeInsets.all(10),
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: currentWaifus.length,
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 150,
                          childAspectRatio: 3 / 4,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 20,
                        ),
                        itemBuilder: (context, index) {
                          final waifu = currentWaifus[index];

                          return CardImage(
                            imageUrl: waifu.imageUrl ?? "",
                            title: waifu.title ?? "",
                            subtitle: waifu.anime != null
                                ? waifu.anime?.name
                                : waifu.manga?.name,
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
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: widget.ad == null
                    ? Colors.transparent
                    : Colors.grey.shade200,
              ),
            ),
          ),
          width: double.infinity,
          height: widget.ad != null ? 75 : 0,
          child: widget.ad != null
              ? AdWidget(
                  ad: widget.ad!,
                )
              : Container(),
        ),
      ],
    );
  }
}
