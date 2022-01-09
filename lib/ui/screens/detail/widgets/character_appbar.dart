import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:random_waifu/data/models/models.dart';
import 'package:random_waifu/data/utils/date_helper.dart';

class CharacterAppbar extends StatelessWidget {
  final double bottomAppBarSize = 90;
  final JsonWaifu waifu;
  final Widget body;
  final String? date;

  const CharacterAppbar(
      {Key? key, required this.waifu, required this.body, required this.date})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            expandedHeight: 350.0,
            collapsedHeight: 50,
            toolbarHeight: 37,
            backgroundColor: Theme.of(context).primaryColor,
            pinned: true,
            floating: true,
            elevation: 0,
            leading: Ink(
              decoration: ShapeDecoration(
                color: Colors.black.withAlpha(120),
                shape: CircleBorder(),
              ),
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
            ),
            bottom: bottomSection(context),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  Positioned.fill(
                    child: Image.network(
                      waifu.imageUrl ?? "",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withAlpha(20),
                            Colors.black.withAlpha(50),
                            Colors.black.withAlpha(255),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ];
      },
      body: body,
    );
  }

  PreferredSize bottomSection(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(bottomAppBarSize),
      child: SizedBox(
        width: double.infinity,
        height: bottomAppBarSize,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: 20,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white,
                      blurRadius: 0.0,
                      spreadRadius: 1.0,
                      offset: const Offset(0, 0),
                    ),
                  ],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                  color: Colors.white,
                ),
              ),
            ),
            Align(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * .9,
                child: PhysicalModel(
                  elevation: 4,
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  shadowColor:
                      Theme.of(context).colorScheme.primary.withAlpha(50),
                  shape: BoxShape.rectangle,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          waifu.title ?? "",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Date Obtained:",
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.access_time,
                                  size: 20,
                                  color: Colors.grey.shade500,
                                ),
                                const SizedBox(
                                  width: 7,
                                ),
                                Text(
                                  date != null ? DateHelper.getFullDate(date!) : "Unknown",
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
