import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_media_downloader/Controllers/AppController.dart';
import 'package:instagram_media_downloader/Widgets/HomePageWidgets/HomePageBody.dart';
import 'package:instagram_media_downloader/Widgets/HomePageWidgets/Panel.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: Icon(Icons.menu),
      //   elevation: 0,
      //   backgroundColor: color3,
      // ),
      body: GetBuilder(
        init: AppController(),
        builder: (AppController controller) {
          return SlidingUpPanel(
            controller: controller.panelController,
            minHeight: controller.minPanelHeight.value,
            maxHeight: controller.maxPanelHeight.value,
            color: Colors.transparent,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(36),
              topRight: Radius.circular(36),
            ),
            body: HomePageBody(),
            panelBuilder: (sc) {
              return PanelWidget(
                sc: sc,
              );
            },
          );
        },
      ),
    );
  }
}
