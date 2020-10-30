import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_admob/native_admob_controller.dart';
import 'package:random_waifu/data/models/ApiModels/CharacterInformation.dart';
import 'package:random_waifu/ui/widgets/CharacterDetail/CharacterExpandableWidget.dart';
import 'package:random_waifu/ui/widgets/CharacterDetail/CharacterSideImage.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';

//ca-app-pub-4382391968703736/3980387355
class CharacterDetailInformation extends StatefulWidget {
  final CharacterInformation characterInformation;
  String about;
  static const _adUnitID = "ca-app-pub-4382391968703736/3980387355";


  CharacterDetailInformation({Key key, this.characterInformation})
      : super(key: key) {
    about = characterInformation.about
        .replaceAll(new RegExp(r'\\n'), '\n')
        .replaceAll(new RegExp(r'\/'), '').replaceAll(new RegExp(r'<spoiler>'), "").replaceAll(new RegExp(r'<//spoiler>'), "");
  }

  @override
  _CharacterDetailInformationState createState() => _CharacterDetailInformationState();
}

class _CharacterDetailInformationState extends State<CharacterDetailInformation> {
  final _controller = NativeAdmobController();

    @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
                    widget.about,
                    style: TextStyle(fontSize: 18, color: Colors.grey.shade800),
                    textAlign: TextAlign.justify,
                  ),
                )
              ],
            ),
          ),
          Divider(),
          CharacterExpandableWidget(
            child: widget.characterInformation.animeography.length == 0
                ? ListTile(
                    leading: Icon(Icons.help_outline),
                    title: Text("No animes found"),
                  )
                : ListView.builder(
                    itemCount: widget.characterInformation.animeography.length,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CharacterSideImage(
                            imageUrl: widget.characterInformation
                                .animeography[index].image_url),
                        title:
                            Text(widget.characterInformation.animeography[index].name),
                        subtitle: Text(
                            "Role: ${widget.characterInformation.animeography[index].role}"),
                      );
                    },
                  ),
            header: "Animes",
          ),
          Divider(),
          CharacterExpandableWidget(
            child: widget.characterInformation.mangaography.length == 0
                ? ListTile(
                    leading: Icon(Icons.help_outline),
                    title: Text("No mangas found"),
                  )
                : ListView.builder(
                    itemCount: widget.characterInformation.mangaography.length,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CharacterSideImage(
                            imageUrl: widget.characterInformation
                                .mangaography[index].image_url),
                        title:
                            Text(widget.characterInformation.mangaography[index].name),
                        subtitle: Text(
                            "Role: ${widget.characterInformation.mangaography[index].role}"),
                      );
                    },
                  ),
            header: "Mangas",
          ),
          Divider(),
          CharacterExpandableWidget(
            child: widget.characterInformation.voice_actors.length == 0
                ? ListTile(
                    leading: Icon(Icons.help_outline),
                    title: Text("No voice actors found"),
                  )
                : ListView.builder(
                    itemCount: widget.characterInformation.voice_actors.length,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CharacterSideImage(
                            imageUrl: widget.characterInformation
                                .voice_actors[index].image_url),
                        title:
                            Text(widget.characterInformation.voice_actors[index].name),
                        subtitle: Text(
                            "Language: ${widget.characterInformation.voice_actors[index].language}"),
                      );
                    },
                  ),
            header: "Voice actors",
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 50),
            height: 100,
            child: NativeAdmob(
              controller: _controller,
              adUnitID: CharacterDetailInformation._adUnitID,
              loading: Center(
                child: CircularProgressIndicator(),
              ),
              type: NativeAdmobType.full,
            ),
          )
        ],
      ),
    );
  }
}
