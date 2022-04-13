import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:random_waifu/data/models/models.dart';
import 'package:random_waifu/ui/screens/detail/widgets/expandable_widget.dart';
import 'package:random_waifu/ui/screens/detail/widgets/side_image.dart';
import 'package:url_launcher/url_launcher.dart';

class CharacterDetailInformation extends StatelessWidget {
  final Waifu characterInformation;
  final String? date;
  final NativeAd? adWidget;
  final double marginBetweenCards = 20;

  CharacterDetailInformation({
    Key? key,
    required this.characterInformation,
    this.date,
    this.adWidget,
  }) : super(key: key);

  String? _getAboutWithoutSpoiler() {
    return characterInformation.about
        ?.replaceAll(new RegExp(r'\\n'), '\n')
        .replaceAll(new RegExp(r'\/'), '')
        .replaceAll(new RegExp(r'<spoiler>'), "")
        .replaceAll(new RegExp(r'<\\spoiler>'), "");
  }

  @override
  Widget build(BuildContext context) {
    final about = _getAboutWithoutSpoiler();

    return ListView(
      padding: EdgeInsets.all(16),
      children: <Widget>[
        SizedBox(
          height: 20,
        ),
        CharacterExpandableWidget(
          child: Padding(
            padding: const EdgeInsets.only(
              bottom: 8.0,
              left: 20,
              right: 20,
            ),
            child: Text(
              about ?? "No information",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade700,
                height: 1.5,
              ),
            ),
          ),
          header: "About",
        ),
        SizedBox(
          height: marginBetweenCards,
        ),
        CharacterExpandableWidget(
          child: characterInformation.animeography?.length == 0
              ? ListTile(
                  contentPadding: EdgeInsets.all(0),
                  leading: Icon(Icons.help_outline),
                  title: Text("No animes found"),
                )
              : _getAnimesList(
                  characterInformation.animeography!,
                  Subtitles.animes.index,
                ),
          header: "Animes",
        ),
        SizedBox(
          height: marginBetweenCards,
        ),
        CharacterExpandableWidget(
          child: characterInformation.mangaography?.length == 0
              ? ListTile(
                  contentPadding: EdgeInsets.all(0),
                  leading: Icon(Icons.help_outline),
                  title: Text("No mangas found"),
                )
              : _getMangasList(
                  characterInformation.mangaography!,
                  Subtitles.mangas.index,
                ),
          header: "Mangas",
        ),
        SizedBox(
          height: marginBetweenCards,
        ),
        CharacterExpandableWidget(
          child: characterInformation.voiceActors?.length == 0
              ? ListTile(
                  contentPadding: EdgeInsets.all(0),
                  leading: Icon(Icons.help_outline),
                  title: Text("No voice actresses found"),
                )
              : _getRolesList(
                  characterInformation.voiceActors!,
                  Subtitles.actresses.index,
                ),
          header: "Voice actresses",
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: 20),
          height: 100,
          child: adWidget != null
              ? AdWidget(
                  ad: adWidget!,
                )
              : Center(
                  child: CircularProgressIndicator(),
                ),
        )
      ],
    );
  }

  ListView _getRolesList(List<VoiceActressInformation> list, int subtitle) {
    return ListView.builder(
      padding: EdgeInsets.all(0),
      itemCount: list.length,
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      itemBuilder: (context, index) {
        final current = list[index];
        return _infoTile(
          current.person?.name ?? "",
          current.person?.getImage() ?? "",
          "Language: ${current.language ?? ""}",
          current.person?.url,
        );
      },
    );
  }

  ListView _getMangasList(List<Manga> list, int subtitle) {
    return ListView.builder(
      padding: EdgeInsets.all(0),
      itemCount: list.length,
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      itemBuilder: (context, index) {
        final current = list[index];
        return _infoTile(
          current.manga?.title ?? "",
          current.manga?.getImage() ?? "",
          "Role: ${current.role ?? ""}",
          current.manga?.url,
        );
      },
    );
  }

  ListView _getAnimesList(List<Anime> list, int subtitle) {
    return ListView.builder(
      padding: EdgeInsets.all(0),
      itemCount: list.length,
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      itemBuilder: (context, index) {
        final current = list[index];
        return _infoTile(
          current.anime?.title ?? "",
          current.anime?.getImage() ?? "",
          "Role: ${current.role ?? ""}",
          current.anime?.url,
        );
      },
    );
  }

  Widget _infoTile(
      String title, String imageUrl, String subtitle, String? url) {
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: () async {
          final canLaunchUrl = await canLaunch(url ?? "");
          if (canLaunchUrl) launch(url!);
        },
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          child: ListTile(
            leading: CharacterSideImage(
              imageUrl: imageUrl,
            ),
            contentPadding: EdgeInsets.all(0),
            title: Text(title),
            subtitle: Text(
              subtitle,
            ),
          ),
        ),
      ),
    );
  }
}

enum Subtitles { animes, mangas, actresses }
