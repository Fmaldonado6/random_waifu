import 'package:flutter/material.dart';

class CardImage extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String? subtitle;

  final VoidCallback? onPressed;

  const CardImage({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.indigo.shade200,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        children: [
          Positioned.fill(
              child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          )),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withAlpha(0),
                    Colors.black.withAlpha(0),
                    Colors.black.withAlpha(160),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    subtitle ?? "",
                    style: const TextStyle(
                      fontSize: 13,
                      overflow: TextOverflow.ellipsis,
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Column(
          //   mainAxisSize: MainAxisSize.max,
          //   children: [
          //     Expanded(
          //       flex: 4,
          //       child: Container(
          //         width: double.infinity,
          //         child: ClipRRect(
          //           borderRadius: BorderRadius.only(
          //             topRight: Radius.circular(5),
          //             topLeft: Radius.circular(5),
          //           ),
          //           child: Image.network(
          //             imageUrl,
          //             fit: BoxFit.cover,
          //           ),
          //         ),
          //       ),
          //     ),
          //     Expanded(
          //       flex: 2,
          //       child: Padding(
          //         padding: EdgeInsets.all(5),
          //         child: Container(
          //           width: double.infinity,
          //           child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             children: [
          //               Text(
          //                 title,
          //                 overflow: TextOverflow.ellipsis,
          //                 style: TextStyle(fontSize: 14),
          //               ),
          //               Text(
          //                 subtitle ?? "",
          //                 overflow: TextOverflow.ellipsis,
          //                 style: TextStyle(
          //                   fontSize: 12,
          //                   color: Colors.grey,
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),
          //       ),
          //     )
          //   ],
          // ),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(15),
                onTap: onPressed,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
