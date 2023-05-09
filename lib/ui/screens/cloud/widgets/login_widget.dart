import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_waifu/ui/screens/cloud/cubit/cloud_cubit.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            margin: EdgeInsets.only(top: 30, bottom: 10),
            child: Text(
              "Log into Random Waifu",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
              ),
            ),
          ),
          Container(
            child: Text(
              "Log in to save your waifus to the cloud.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey.shade500,
              ),
            ),
          ),
          SizedBox(
            height: 45,
          ),
          SizedBox(
            height: 45,
            width: double.infinity,
            child: SignInButton(
              Buttons.Google,
              onPressed: () => context.read<CloudCubit>().loginGoogle(),
              elevation: 5,
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: Colors.transparent),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Platform.isIOS
              ? SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: SignInButton(
                    Buttons.Apple,
                    onPressed: () => context.read<CloudCubit>().loginApple(),
                    elevation: 5,
                    shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.transparent),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
