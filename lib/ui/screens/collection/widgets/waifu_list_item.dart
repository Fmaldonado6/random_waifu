import 'package:flutter/material.dart';
import 'package:random_waifu/data/models/models.dart';
import 'package:random_waifu/ui/screens/detail/detail_page.dart';

class WaifuListItem extends StatelessWidget {
  final JsonWaifu waifu;

  const WaifuListItem({Key? key,required this.waifu}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade200,
          ),
        ),
      ),
      child: Material(
        color: Colors.white,
        child: InkWell(
          child: ListTile(
            leading: Material(
              child: Image.network(
                waifu.imageUrl ?? "",
                width: 45,
              ),
              elevation: 4.0,
              shape: CircleBorder(),
              clipBehavior: Clip.antiAlias,
            ),
            title: Text(
              waifu.title ?? "",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            trailing: Icon(Icons.chevron_right),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailPage(
                  waifu: waifu,
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
