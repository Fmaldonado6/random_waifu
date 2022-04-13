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
    return PhysicalModel(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
      shadowColor: Theme.of(context).colorScheme.primary.withAlpha(50),
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
        child: Column(
          children: <Widget>[
            ExpandablePanel(
              collapsed: Container(),
              theme: ExpandableThemeData(
                bodyAlignment: ExpandablePanelBodyAlignment.center,
                useInkWell: true,
              ),
              header: Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: Text(
                  header,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              expanded: child,
            )
          ],
        ),
      ),
    );
  }
}
