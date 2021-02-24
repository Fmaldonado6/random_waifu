import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';
import 'package:flutter_native_admob/native_admob_controller.dart';
import 'package:hive/hive.dart';
import 'package:random_waifu/data/models/models.dart';
import 'package:random_waifu/ui/widgets/CharacterDetail/CharacterSideImage.dart';

import 'DetailPage.dart';

class HistoryPage extends StatefulWidget {
  HistoryPage({Key key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  var _adUnitID = "ca-app-pub-4382391968703736/3980387355";
  final _controller = NativeAdmobController();
  double _adHeigt = 0;
  StreamSubscription _subscription;

  @override
  void initState() {
    super.initState();
    _subscription = _controller.stateChanged.listen(_onStateChanged);
    _controller.setTestDeviceIds(["61B459AEEFB59EDE3D5B4B0268E5D490"]);
  }

  @override
  void dispose() {
    _subscription.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _onStateChanged(AdLoadState state) {
    switch (state) {
      case AdLoadState.loading:
        setState(() {
          _adHeigt = 0;
        });
        break;

      case AdLoadState.loadCompleted:
        setState(() {
          _adHeigt = 100;
        });
        break;

      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Collection",
          style: TextStyle(fontSize: 25),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 10.0,
            ),
          ],
        ),
        child: _buildList(),
      ),
    );
  }

  Widget _buildList() {
    final savedCharacters = Hive.box('savedCharacters');
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: ListView.separated(
        itemCount: savedCharacters.length,
        separatorBuilder: (context, index) => Divider(
          color: Colors.grey,
        ),
        itemBuilder: (context, index) {
          final character = savedCharacters.getAt(index) as SavedCharacter;
          print(character.imageUrl);
          return Material(
            color: Colors.white,
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return DetailPage(
                    characterId: character.characterId,
                  );
                }));
              },
              child: Padding(
                padding: EdgeInsets.only(top: 5, bottom: 5),
                child: Column(
                  children: <Widget>[
                    index % 5 == 0 && index != 0
                        ? Container(
                            padding: EdgeInsets.all(8),
                            margin:
                                EdgeInsets.only(bottom: _adHeigt == 0 ? 0 : 10),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: _adHeigt == 0
                                            ? Colors.transparent
                                            : Colors.grey.shade300))),
                            width: double.infinity,
                            height: _adHeigt,
                            child: NativeAdmob(
                              adUnitID: _adUnitID,
                              controller: _controller,
                              type: NativeAdmobType.full,
                              loading: Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                          )
                        : Container(),
                    ListTile(
                      leading: CharacterSideImage(imageUrl: character.imageUrl),
                      title: Text(
                        character.name,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      trailing: Icon(Icons.chevron_right),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
