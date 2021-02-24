import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:hive/hive.dart';
import 'package:random_waifu/ui/bloc/InformationBloc/InformationCubit.dart';

class ConfirmDialog {
  void show(
      {BuildContext context,
      String title,
      String text,
      String confirm = "Ok",
      Function callback}) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text(text),
            actions: <Widget>[
              RaisedButton(
                color: Colors.indigoAccent,
                onPressed: () async {
                  callback();
                },
                child: Text(confirm),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Close"),
              ),
            ],
          );
        },);
  }
}
