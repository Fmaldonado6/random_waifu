import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';
import 'package:flutter_native_admob/native_admob_controller.dart';
import 'package:hive/hive.dart';
import 'package:random_waifu/app_config.dart';
import 'package:random_waifu/screens/collection/widgets/waifu_list_item.dart';

class CollectionLoaded extends StatefulWidget {
  final Box<dynamic> waifus;
  CollectionLoaded({Key key, this.waifus});

  @override
  _CollectionLoadedState createState() => _CollectionLoadedState();
}

class _CollectionLoadedState extends State<CollectionLoaded> {
  final _adUnitID = AppConfig().adId;
  double adHeight = 0;
  final NativeAdmobController _controller = NativeAdmobController();
  StreamSubscription _subscription;

  @override
  void initState() {
    _subscription = _controller.stateChanged.listen(_onStateChanged);

    super.initState();
  }

  void _onStateChanged(AdLoadState state) {
    switch (state) {
      case AdLoadState.loading:
        setState(() {
          adHeight = 0;
        });
        break;

      case AdLoadState.loadCompleted:
        setState(() {
          adHeight = 100;
        });
        break;

      default:
        break;
    }
  }

  @override
  void dispose() {
    _subscription.cancel();
    _controller.dispose();
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
                waifu: widget.waifus.getAt(index),
              );
            },
          ),
        ),
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color:
                    adHeight == 0 ? Colors.transparent : Colors.grey.shade200,
              ),
            ),
          ),
          width: double.infinity,
          height: adHeight,
          child: NativeAdmob(
            adUnitID: _adUnitID,
            controller: _controller,
            type: NativeAdmobType.full,
            loading: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ),
      ],
    );
  }
}
