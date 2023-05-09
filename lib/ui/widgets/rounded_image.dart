import 'package:flutter/material.dart';

class RoundedImage extends StatefulWidget {
  final String imageUrl;
  const RoundedImage({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  State<RoundedImage> createState() => _RoundedImageState();
}

class _RoundedImageState extends State<RoundedImage> {
  bool hasError = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      width: 125,
      height: 125,
      child: hasError
          ? Icon(
              Icons.person_outline,
              size: 60,
            )
          : null,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: hasError ? Colors.white : null,
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 5.0,
          ),
        ],
        image: DecorationImage(
          fit: BoxFit.cover,
          onError: (exception, stackTrace) {
            setState(() {
              hasError = true;
            });
          },
          filterQuality: FilterQuality.high,
          image: NetworkImage(widget.imageUrl.replaceAll("s96-c", "s400-c")),
        ),
      ),
    );
  }
}
