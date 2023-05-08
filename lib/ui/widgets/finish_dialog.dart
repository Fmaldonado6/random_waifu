import 'package:flutter/material.dart';

class EndDialog {
  void show({
    required BuildContext context,
    required String title,
    required String text,
    required Function callback,
    String confirm = "Ok",
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(text),
          actions: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigoAccent,
              ),
              onPressed: () async {
                callback();
              },
              child: Text(confirm),
            ),
            TextButton(
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
