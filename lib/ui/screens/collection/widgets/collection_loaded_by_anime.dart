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
          child: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
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
                            Container(
                              height: 200,
                              child: ListView.builder(
                                padding: EdgeInsets.only(left: 20, bottom: 20),
                                scrollDirection: Axis.horizontal,
                                itemCount: currentWaifus.length,
                                itemBuilder: (context, gridIndex) {
                                  final waifu = currentWaifus[gridIndex];
                                  return Container(
                                    width: 130,
                                    margin: EdgeInsets.only(right: 20),
                                    height: 200,
                                    child: CardImage(
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
                                    ),
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  childCount: widget.waifus.length,
                ),
              )
            ],
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
