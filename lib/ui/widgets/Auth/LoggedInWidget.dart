import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:random_waifu/services/DatabaseService.dart';
import 'package:random_waifu/ui/bloc/authCubit/auth_cubit.dart';
import 'package:random_waifu/ui/widgets/shared/ConfirmDialogWidget.dart';
import 'package:random_waifu/ui/widgets/shared/RoundedImage.dart';
import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:flutter_bloc/flutter_bloc.dart';

class LoggedInWidget extends StatelessWidget {
  final User userInformation;

  LoggedInWidget({Key key, @required this.userInformation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          RoundedImage(
            imageUrl: userInformation.photoURL,
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 20),
              child: Text(
                userInformation.displayName,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Divider(),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RaisedButton.icon(
                  color: Colors.indigo.shade100,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  onPressed: () => ConfirmDialog().show(
                    context: context,
                    title: "Save waifus",
                    text: "This action will override your cloud saved waifus",
                    callback: () => saveWaifus(context),
                  ),
                  icon: Icon(Icons.upload_outlined),
                  label: Text(
                    "Save waifus",
                  ),
                ),
                RaisedButton.icon(
                  color: Colors.indigo.shade100,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  onPressed: () => ConfirmDialog().show(
                    context: context,
                    title: "Load waifus",
                    text: "This action will override your current waifus",
                    callback: () => loadWaifus(context),
                  ),
                  icon: Icon(Icons.download_outlined),
                  label: Text(
                    "Load waifus",
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: FlatButton(
              onPressed: () => context.bloc<AuthCubit>().signOut(),
              child: Text(
                "Sign out",
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void saveWaifus(BuildContext context) async {
    var res = await context.read<AuthCubit>().saveWaifus(userInformation.uid);
    var string = "Waifus saved!";
    if (!res) string = "Couldn´t save waifus!";

    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text(string),
      ),
    );

    Navigator.of(context).pop();
  }

  void loadWaifus(BuildContext context) async {
    var res = await context.bloc<AuthCubit>().loadWaifus(userInformation.uid);
    var string = "Waifus loaded!";
    if (!res) string = "Couldn´t load waifus!";

    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text(string),
      ),
    );
    Navigator.of(context).pop();
  }
}
