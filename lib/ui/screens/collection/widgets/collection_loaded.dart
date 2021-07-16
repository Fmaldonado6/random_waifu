import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:random_waifu/data/models/models.dart';
import 'package:random_waifu/ui/screens/collection/widgets/waifu_list_item.dart';

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
          child: ListView.builder(
            itemCount: widget.waifus.length,
            itemBuilder: (context, index) {
              return WaifuListItem(
                waifu: widget.waifus[index]
              );
            },
          ),
        ),
        Container(
          padding: EdgeInsets.all(8),
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
          height: widget.ad != null ? 100 : 0,
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
