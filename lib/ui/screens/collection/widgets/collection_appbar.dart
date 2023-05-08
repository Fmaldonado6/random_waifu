import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CollectionAppbar extends StatelessWidget {
  final double bottomAppBarSize = 50;
  final Widget body;
  final List<Widget> actions;

  final int totalWaifus;
  final int collectedWaifus;
  const CollectionAppbar({
    Key? key,
    required this.body,
    required this.totalWaifus,
    required this.collectedWaifus,
    required this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            expandedHeight: 100.0,
            collapsedHeight: 60,
            toolbarHeight: 37,
            backgroundColor: Theme.of(context).primaryColor,
            pinned: true,
            floating: true,
            centerTitle: true,
            title: Text(
              "Collection",
              style: TextStyle(fontSize: 22),
            ),
            elevation: 0,
            actions: actions,
            leading: Ink(
              decoration: ShapeDecoration(
                color: Colors.black.withAlpha(120),
                shape: CircleBorder(),
              ),
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                iconSize: 20,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
            ),
            bottom: bottomSection(context),
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Waifus:",
                              style: const TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.person_2_outlined,
                                  size: 20,
                                  color: Colors.grey.shade500,
                                ),
                                const SizedBox(
                                  width: 7,
                                ),
                                Text(
                                  "$collectedWaifus/$totalWaifus",
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
