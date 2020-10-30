import 'package:flutter/material.dart';

class CharacterDetailImage extends StatelessWidget {
  final String imageUrl;
  const CharacterDetailImage({Key key, @required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      width: 125,
      height: 125,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 5.0,
          ),
        ],
        image: new DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(imageUrl),
        ),
      ),
    );
  }
}
