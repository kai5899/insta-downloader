import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_media_downloader/Configuration/FontFunctions.dart';
import 'package:instagram_media_downloader/Configuration/Pallete.dart';
import 'package:instagram_media_downloader/Controllers/AppController.dart';
import 'package:instagram_media_downloader/Widgets/PageIndexWidget.dart';

class PanelWidget extends StatelessWidget {
  PanelWidget({Key key, this.sc}) : super(key: key);
  final ScrollController sc;
  final AppController appController = Get.put(AppController());
  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: Container(
        decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(45), topRight: Radius.circular(45))),
        child: Column(
          children: <Widget>[
            Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 12.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 80,
                        height: 10,
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.0))),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 18.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(
                        appController.pages.length,
                        (index) => PageIndexWidget(
                              icon: appController.icons[index],
                              color: appController.currentPageString.value ==
                                      appController.pages[index]
                                  ? color2
                                  : Colors.grey,
                              index: index,
                              onPressed: () {
                                appController.changePage(index);
                              },
                            )),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 16, right: 16),
                    child: ListTile(
                      title: Obx(() => RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                    text: appController.currentPageString.value
                                        .capitalizeFirst,
                                    style: chilankaStyle(
                                        color: black,
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold)),
                                TextSpan(
                                  text: appController.currentPageInt.value == 0
                                      ? "   ${appController.dbController.posts.length} Files."
                                      : "",
                                  style: chilankaStyle(
                                    color: Colors.grey[500],
                                    fontSize: 18,
                                  ),
                                )
                              ],
                            ),
                          )),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: appController.getPageWidget(sc),
              ),
            )
          ],
        ),
      ),
    );
  }
}
