import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:random_waifu/data/models/ApiModels/CharacterInformation.dart';
import 'package:random_waifu/ui/widgets/CharacterDetail/CharacterExpandableWidget.dart';
import 'package:random_waifu/ui/widgets/CharacterDetail/CharacterSideImage.dart';

class CharacterDetailInformation extends StatelessWidget {
  final CharacterInformation characterInformation;
  String about;

  CharacterDetailInformation({Key key, this.characterInformation})
      : super(key: key) {
    about = characterInformation.about
        .replaceAll(new RegExp(r'\\n'), '\n')
        .replaceAll(new RegExp(r'\/'), '');
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
            child: Column(
              children: <Widget>[
                ExpandablePanel(
                  header: Text(
                    "About",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  expanded: Text(
                    about,
                    style: TextStyle(fontSize: 18, color: Colors.grey.shade800),
                    textAlign: TextAlign.justify,
                  ),
                )
              ],
            ),
          ),
          Divider(),
          CharacterExpandableWidget(
            child: characterInformation.animeography.length == 0
                ? ListTile(
                    leading: Icon(Icons.help_outline),
                    title: Text("No animes found"),
                  )
                : ListView.builder(
                    itemCount: characterInformation.animeography.length,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CharacterSideImage(
                            imageUrl: characterInformation
                                .animeography[index].image_url),
                        title:
                            Text(characterInformation.animeography[index].name),
                        subtitle: Text(
                            "Role: ${characterInformation.animeography[index].role}"),
                      );
                    },
                  ),
            header: "Animes",
          ),
          Divider(),
          CharacterExpandableWidget(
            child: characterInformation.mangaography.length == 0
                ? ListTile(
                    leading: Icon(Icons.help_outline),
                    title: Text("No mangas found"),
                  )
                : ListView.builder(
                    itemCount: characterInformation.mangaography.length,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CharacterSideImage(
                            imageUrl: characterInformation
                                .mangaography[index].image_url),
                        title:
                            Text(characterInformation.mangaography[index].name),
                        subtitle: Text(
                            "Role: ${characterInformation.mangaography[index].role}"),
                      );
                    },
                  ),
            header: "Mangas",
          ),
          Divider(),
          CharacterExpandableWidget(
            child: characterInformation.voice_actors.length == 0
                ? ListTile(
                    leading: Icon(Icons.help_outline),
                    title: Text("No voice actors found"),
                  )
                : ListView.builder(
                    itemCount: characterInformation.voice_actors.length,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CharacterSideImage(
                            imageUrl: characterInformation
                                .voice_actors[index].image_url),
                        title:
                            Text(characterInformation.voice_actors[index].name),
                        subtitle: Text(
                            "Language: ${characterInformation.voice_actors[index].language}"),
                      );
                    },
                  ),
            header: "Voice actors",
          ),
        ],
      ),
    );
  }
}
