import 'dart:io';

import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final String title;
  final bool backIcon;
  final VoidCallback? onPressed;

  const TitleWidget({
    Key? key,
    required this.title,
    this.onPressed,
    this.backIcon = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: Stack(
        children: [
          backIcon
              ? Align(
                  alignment: Alignment.bottomLeft,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(50),
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Icon(
                        Platform.isAndroid
                            ? Icons.arrow_back
                            : Icons.arrow_back_ios_new,
                        size: 15.0,
                        color: Colors.white,
                      ),
                    ),
                    onTap: onPressed,
                  ),
                )
              : Container(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
