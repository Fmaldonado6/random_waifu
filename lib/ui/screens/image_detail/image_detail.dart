import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:photo_view/photo_view.dart';

class ImageDetailPage extends StatelessWidget {
  late PageController controller;
  final List<String> pictures;
  final int initial;
  final String title;
  ImageDetailPage({
    Key? key,
    required this.title,
    required this.pictures,
    this.initial = 0,
  }) : super(key: key) {
    this.controller = PageController(initialPage: initial);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Color(0x44000000),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        elevation: 0,
        title: Text(title),
      ),
      backgroundColor: Colors.black,
      body: PageView(
        controller: controller,
        children: pictures.map((e) => buildPictures(context, e)).toList(),
      ),
    );
  }

  Widget buildPictures(BuildContext context, String picture) {
    return Container(
      width: double.infinity,
      child: InkWell(
        onLongPress: () {
          openSaveBottomSheet(context, picture);
        },
        child: PhotoView(
          initialScale: PhotoViewComputedScale.contained,
          filterQuality: FilterQuality.high,
          minScale: PhotoViewComputedScale.contained,
          imageProvider: NetworkImage(
            picture,
          ),
        ),
      ),
    );
  }

  void openSaveBottomSheet(BuildContext context, String picture) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.only(top: 16, bottom: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              onTap: () async {
                try {
                  await GallerySaver.saveImage(picture);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Image Saved")),
                  );
                  Navigator.pop(context);
                } catch (e) {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Couldn't save image")),
                  );
                }
              },
              leading: Icon(Icons.save_alt_outlined),
              title: Text("Save Image"),
            )
          ],
        ),
      ),
    );
  }
}
