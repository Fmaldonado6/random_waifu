import 'package:flutter/material.dart';

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
      },
    );
  }
}
