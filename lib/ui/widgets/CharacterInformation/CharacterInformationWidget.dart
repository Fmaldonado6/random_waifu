import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:hive/hive.dart';
import 'package:random_waifu/ui/bloc/InformationBloc/InformationBloc.dart';
import 'package:random_waifu/ui/widgets/CharacterInformation/CharacterImage.dart';
import 'package:random_waifu/ui/widgets/CharacterInformation/CharacterNameWidget.dart';

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
          margin: EdgeInsets.only(top:30,bottom: 30),
          alignment: Alignment.topLeft,
          width: double.infinity,
          child: IconButton(
            icon: Icon(Icons.feedback),
            color: Colors.white,
            onPressed: () => {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Not a waifu report"),
                    content: Text(
                        "Would you like to report this character?"),
                    actions: <Widget>[
                      RaisedButton(
                        color: Colors.indigoAccent,
                        onPressed: () async {
                          final Email email = Email(
                            body:
                                'Character name: ${this.name}\nCharacter id: ${this.malId}',
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
                          BlocProvider.of<InformationBloc>(parentContext)
                              .getRandomWaifu();
                        },
                        child: Text("Report"),
                      ),
                      FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text("Close"),
                      ),
                    ],
                  );
                },
              ),
            },
          ),
        ),
        CharacterNameWidget(
          name: name,
          malId: malId,
        ),
      ],
    );
  }
}
