import 'package:flutter/material.dart';
import 'package:random_waifu/ui/pages/DetailPage.dart';

class CharacterNameWidget extends StatelessWidget {
  String name;
  final int malId;

  CharacterNameWidget({Key key, this.name, this.malId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 17,
      child: Ink(
          width: double.infinity,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              topLeft: Radius.circular(10),
            ),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 10.0,
              ),
            ],
          ),
          child: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailPage(characterId: malId,);
              }));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.account_circle,
                  size: 35,
                  color: Colors.grey.shade800,
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Name:",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
