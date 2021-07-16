import 'package:auth_buttons/auth_buttons.dart';
import 'package:flutter/material.dart';
import 'package:random_waifu/screens/cloud/cubit/cloud_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          margin: EdgeInsets.only(top: 20),
          padding: EdgeInsets.all(20),
          child: Text(
            "Sign in to save or load your waifus to the cloud.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 17,
              color: Colors.grey,
            ),
          ),
        ),
        Divider(),
        Container(
          margin: EdgeInsets.only(top: 20),
          child: GoogleAuthButton(
            onPressed: () => {context.read<CloudCubit>().login()},
          ),
        )
      ],
    );
  }
}
