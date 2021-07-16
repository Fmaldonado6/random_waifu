import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:random_waifu/models/models.dart';
import 'package:random_waifu/screens/detail/widgets/expandable_widget.dart';
import 'package:random_waifu/screens/detail/widgets/side_image.dart';

class CharacterDetailInformation extends StatefulWidget {
  final Waifu characterInformation;
  final String? date;
  final NativeAd? adWidget;

  CharacterDetailInformation({
    Key? key,
    required this.characterInformation,
    this.date,
    this.adWidget,
  }) : super(key: key);

  @override
  _CharacterDetailInformationState createState() =>
      _CharacterDetailInformationState();
}

class _CharacterDetailInformationState
    extends State<CharacterDetailInformation> {
  @override
  void dispose() {
    super.dispose();
  }

  String _getAboutWithoutSpoiler() {
    return widget.characterInformation.about!
        .replaceAll(new RegExp(r'\\n'), '\n')
        .replaceAll(new RegExp(r'\/'), '')
        .replaceAll(new RegExp(r'<spoiler>'), "")
        .replaceAll(new RegExp(r'<\\spoiler>'), "");
  }

  @override
  Widget build(BuildContext context) {
    final about = _getAboutWithoutSpoiler();

    return Expanded(
      child: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
            child: Column(
              children: <Widget>[
                ExpandablePanel(
                  collapsed: Container(),
                  header: Text(
                    "About",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  expanded: Text(
                    about,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey.shade800,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                )
              ],
            ),
          ),
          Divider(),
          CharacterExpandableWidget(
            child: widget.characterInformation.animeography?.length == 0
                ? ListTile(
                    leading: Icon(Icons.help_outline),
                    title: Text("No animes found"),
                  )
                : _getRolesList(
                    widget.characterInformation.animeography!,
                    Subtitles.animes.index,
                  ),
            header: "Animes",
          ),
          Divider(),
          CharacterExpandableWidget(
            child: widget.characterInformation.mangaography?.length == 0
                ? ListTile(
                    leading: Icon(Icons.help_outline),
                    title: Text("No mangas found"),
                  )
                : _getRolesList(
                    widget.characterInformation.mangaography!,
                    Subtitles.mangas.index,
                  ),
            header: "Mangas",
          ),
          Divider(),
          CharacterExpandableWidget(
            child: widget.characterInformation.voice_actors?.length == 0
                ? ListTile(
                    leading: Icon(Icons.help_outline),
                    title: Text("No voice actresses found"),
                  )
                : _getRolesList(
                    widget.characterInformation.voice_actors!,
                    Subtitles.actresses.index,
                  ),
            header: "Voice actresses",
          ),
          Divider(),
          widget.date != null
              ? Container(
                  padding: EdgeInsets.only(top: 10, left: 10),
                  child: Text(
                    "Obtained on: ${widget.date}",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade600,
                    ),
                  ),
                )
              : Container(),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 30),
            height: 100,
            child: widget.adWidget != null
                ? AdWidget(
                    ad: widget.adWidget!,
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  ),
          )
        ],
      ),
    );
  }

  ListView _getRolesList(List<AnimeInformation> list, int subtitle) {
    return ListView.builder(
      itemCount: list.length,
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      itemBuilder: (context, index) {
        return ListTile(
          leading: CharacterSideImage(
            imageUrl: list[index].image_url ?? "",
          ),
          title: Text(list[index].name!),
          subtitle: Text(
            subtitle > Subtitles.mangas.index
                ? "Language: ${list[index].language}"
                : "Role: ${list[index].role}",
          ),
        );
      },
    );
  }
}

enum Subtitles { animes, mangas, actresses }
