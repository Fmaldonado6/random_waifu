import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class CharacterExpandableWidget extends StatelessWidget {
  final String header;
  final Widget child;

  CharacterExpandableWidget({
    Key? key,
    required this.child,
    required this.header,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
      child: Column(
        children: <Widget>[
          ExpandablePanel(
            collapsed: Container(),
            header: Text(
              header,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            expanded: child,
          )
        ],
      ),
    );
  }
}
