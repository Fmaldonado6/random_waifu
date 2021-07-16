import 'package:flutter/material.dart';

class CharacterImage extends StatelessWidget {
  final String imageUrl;

  CharacterImage({Key? key,required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 70,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 20.0,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            imageUrl,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
