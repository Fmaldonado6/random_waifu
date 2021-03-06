import 'package:flutter/material.dart';
import 'package:random_waifu/data/models/models.dart';
import 'package:random_waifu/ui/screens/detail/detail_page.dart';
import 'package:random_waifu/ui/screens/home/widgets/countdown_timer.dart';

class CharacterNameWidget extends StatelessWidget {
  final JsonWaifu waifu;

  CharacterNameWidget({
    Key? key,
    required this.waifu,
  }) : super(key: key);

  getDateFormated() {
    return "${DateTime.now().day} / ${DateTime.now().month} / ${DateTime.now().year}";
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 20,
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
              return DetailPage(
                waifu: waifu,
                date: getDateFormated(),
              );
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
                  Container(
                    constraints: BoxConstraints(maxWidth: 270),
                    child: Text(
                      waifu.title ?? "",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  )
                ],
              ),
              CountdownTimer()
            ],
          ),
        ),
      ),
    );
  }
}
