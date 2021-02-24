import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:hive/hive.dart';
import 'package:random_waifu/ui/bloc/InformationBloc/InformationCubit.dart';
import 'package:random_waifu/ui/pages/AccountPage.dart';
import 'package:random_waifu/ui/widgets/CharacterInformation/CharacterImage.dart';
import 'package:random_waifu/ui/widgets/CharacterInformation/CharacterNameWidget.dart';
import 'package:random_waifu/ui/widgets/shared/ConfirmDialogWidget.dart';

class CharacterInformationWidget extends StatelessWidget {
  final String imageUrl;
  BuildContext parentContext;
  final int malId;
  final String name;
  CharacterInformationWidget({Key key, this.name, this.imageUrl, this.malId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    parentContext = context;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).size.height / 15,
        ),
        CharacterImage(
          imageUrl: imageUrl,
        ),
        Container(
            margin: EdgeInsets.only(top: 30, bottom: 30),
            alignment: Alignment.topLeft,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.feedback),
                  color: Colors.white,
                  onPressed: () => {
                    ConfirmDialog().show(
                      context: parentContext,
                      title: "Not a waifu report",
                      confirm: "Report",
                      text: "Would you like to report this character?",
                      callback: () => {
                        reportWaifu(context),
                      },
                    ),
                  },
                ),
                IconButton(
                  icon: Icon(Icons.cloud),
                  color: Colors.white,
                  onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) {
                          return AccountPage();
                        },
                      ),
                    )
                  },
                ),
              ],
            )),
        CharacterNameWidget(
          name: name,
          malId: malId,
        ),
      ],
    );
  }

  void reportWaifu(context) async {
    final Email email = Email(
      body: 'Character name: ${name}\nCharacter id: ${malId}',
      subject: 'Not a waifu report :(',
      cc: ['logicappsfeedback@gmail.com'],
      isHTML: false,
    );

    await FlutterEmailSender.send(email);
    var characters = Hive.box("savedCharacters");
    var lastDate = Hive.box("today");
    await Hive.box('today').clear();

    await characters.deleteAt(characters.length - 1);

    print(characters.length);
    Navigator.of(context).pop();
    BlocProvider.of<InformationCubit>(context).getRandomWaifu();
  }
}
