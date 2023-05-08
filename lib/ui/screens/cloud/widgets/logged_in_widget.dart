import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_waifu/ui/screens/cloud/cubit/cloud_cubit.dart';
import 'package:random_waifu/ui/widgets/confirm_dialog_widget.dart';
import 'package:random_waifu/ui/widgets/rounded_image.dart';

class LoggedInWidget extends StatelessWidget {
  final User userInformation;
  final bool autoSave;

  LoggedInWidget({
    Key? key,
    required this.userInformation,
    required this.autoSave,
  }) : super(key: key);

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
          SizedBox(
            height: 10,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.download_outlined),
            title: Text("Load Waifus"),
            onTap: () => ConfirmDialog().show(
              context: context,
              title: "Load waifus",
              text: "This action will override your current waifus",
              callback: () => loadWaifus(context),
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.upload_outlined),
            title: Text("Save Waifus"),
            onTap: () => ConfirmDialog().show(
              context: context,
              title: "Save waifus",
              text: "This action will override your cloud saved waifus",
              callback: () => saveWaifus(context),
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.delete_forever_outlined),
            title: Text("Delete account"),
            onTap: () => ConfirmDialog().show(
              context: context,
              title: "Delete account",
              confirm: "Delete Account",
              text:
                  "This action will delete your account and all of your cloud saved waifus",
              callback: () {
                deleteAccount(context);
                Navigator.of(context).pop();
              },
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.power_settings_new_outlined),
            title: Text("Sign Out"),
            onTap: () => context.read<CloudCubit>().signOut(),
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

  void deleteAccount(BuildContext context) async {
    var res = await context.read<CloudCubit>().deleteAccount();
    var string = "Account Deleted!";
    if (!res) string = "Couldn´t delete account!";

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(string),
      ),
    );
    Navigator.of(context).pop();
  }
}
