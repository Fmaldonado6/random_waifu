import 'package:flutter/material.dart';
import 'package:random_waifu/models/models.dart';
import 'package:random_waifu/screens/detail/detail_page.dart';

class WaifuListItem extends StatelessWidget {
  final SavedCharacter waifu;

  const WaifuListItem({Key key, this.waifu}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade300,
          ),
        ),
      ),
      child: Material(
        color: Colors.white,
        child: InkWell(
          child: ListTile(
            leading: Material(
              child: Image.network(
                waifu.imageUrl,
                width: 45,
              ),
              elevation: 4.0,
              shape: CircleBorder(),
              clipBehavior: Clip.antiAlias,
            ),
            title: Text(
              waifu.name,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            trailing: Icon(Icons.chevron_right),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailPage(
                  characterId: waifu.characterId,
                  date: waifu.date,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
