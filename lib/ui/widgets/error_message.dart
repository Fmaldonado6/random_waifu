import 'package:flutter/material.dart';

class ErrorMessages extends StatelessWidget {
  final VoidCallback clickedFunction;
  const ErrorMessages({
    Key? key,
    required this.clickedFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.error,
            size: 55,
            color: Colors.grey,
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              backgroundColor: Colors.indigo.shade100,
            ),
            onPressed: clickedFunction,
            child: Text("RETRY"),
          )
        ],
      ),
    );
  }
}
