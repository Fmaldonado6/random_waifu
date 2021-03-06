import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_waifu/ui/screens/cloud/cubit/cloud_cubit.dart';
import 'package:random_waifu/ui/widgets/confirm_dialog_widget.dart';
import 'package:random_waifu/ui/widgets/rounded_image.dart';

class LoggedInWidget extends StatelessWidget {
  final User userInformation;

  LoggedInWidget({Key? key, required this.userInformation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          RoundedImage(
            imageUrl: userInformation.photoURL ?? "",
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 20),
              child: Text(
                userInformation.displayName ?? "",
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
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.indigo.shade100,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
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
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.indigo.shade100,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
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
            child: TextButton(
              onPressed: () => context.read<CloudCubit>().signOut(),
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
    var res = await context.read<CloudCubit>().saveWaifus(userInformation.uid);
    var string = "Waifus saved!";
    if (!res) string = "Couldn´t save waifus!";

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(string),
      ),
    );

    Navigator.of(context).pop();
  }

  void loadWaifus(BuildContext context) async {
    var res = await context.read<CloudCubit>().loadWaifus(userInformation.uid);
    var string = "Waifus loaded!";
    if (!res) string = "Couldn´t load waifus!";

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(string),
      ),
    );
    Navigator.of(context).pop();
  }
}
