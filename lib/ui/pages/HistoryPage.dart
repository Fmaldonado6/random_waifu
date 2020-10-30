import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:random_waifu/data/models/ApiModels/SavedCharacter.dart';
import 'package:random_waifu/ui/widgets/CharacterDetail/CharacterSideImage.dart';

import 'DetailPage.dart';

class HistoryPage extends StatefulWidget {
  HistoryPage({Key key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
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
          final character = savedCharacters.get(index) as SavedCharacter;
          return Material(
            color: Colors.white,
            child: InkWell(
              onTap: () {
                 Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailPage(characterId: character.characterId,);
              }));
              },
              child: Padding(
                padding: EdgeInsets.only(top: 5, bottom: 5),
                child: ListTile(
                  leading: CharacterSideImage(imageUrl: character.imageUrl),
                  title: Text(character.name,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                  trailing: Icon(Icons.chevron_right),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
