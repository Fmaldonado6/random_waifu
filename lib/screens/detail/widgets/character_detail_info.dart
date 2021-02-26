import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_admob/native_admob_controller.dart';
import 'package:random_waifu/app_config.dart';
import 'package:random_waifu/models/models.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';
import 'package:random_waifu/screens/detail/widgets/expandable_widget.dart';
import 'package:random_waifu/screens/detail/widgets/side_image.dart';

class CharacterDetailInformation extends StatefulWidget {
  final Waifu characterInformation;
  final String date;
  final _adUnitID = AppConfig().adId;

  CharacterDetailInformation({
    Key key,
    this.characterInformation,
    this.date,
  }) : super(key: key);

  @override
  _CharacterDetailInformationState createState() =>
      _CharacterDetailInformationState();
}

class _CharacterDetailInformationState
    extends State<CharacterDetailInformation> {
  final _controller = NativeAdmobController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String _getAboutWithoutSpoiler() {
    return widget.characterInformation.about
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
            child: widget.characterInformation.animeography.length == 0
                ? ListTile(
                    leading: Icon(Icons.help_outline),
                    title: Text("No animes found"),
                  )
                : _getRolesList(
                    widget.characterInformation.animeography,
                    "Role",
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
                : _getRolesList(
                    widget.characterInformation.mangaography,
                    "Role",
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
                : _getRolesList(
                    widget.characterInformation.voice_actors,
                    "Language",
                  ),
            header: "Voice actors",
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
            child: NativeAdmob(
              controller: _controller,
              adUnitID: widget._adUnitID,
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

  ListView _getRolesList(List<AnimeInformation> list, String subtitle) {
    return ListView.builder(
      itemCount: list.length,
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      itemBuilder: (context, index) {
        return ListTile(
          leading: CharacterSideImage(
            imageUrl: list[index].image_url,
          ),
          title: Text(list[index].name),
          subtitle: Text(
            "$subtitle: ${list[index].language}",
          ),
        );
      },
    );
  }
}
