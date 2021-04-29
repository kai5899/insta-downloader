import 'dart:ui';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:get/get.dart';
import 'package:getwidget/components/toggle/gf_toggle.dart';
import 'package:getwidget/getwidget.dart';
import 'package:instagram_media_downloader/Configuration/FontFunctions.dart';
import 'package:instagram_media_downloader/Configuration/Pallete.dart';
import 'package:instagram_media_downloader/Controllers/AppController.dart';

class HomePageBody extends StatelessWidget {
  HomePageBody({Key key}) : super(key: key);

  final AppController appController = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      decoration: BoxDecoration(
          gradient: RadialGradient(colors: [
        color3,
        color3,
      ])),
      child: Column(
        children: [
          SizedBox(
            height: Get.height * 0.06,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Text(
                  "Insta\nDownloader",
                  style: chilankaStyle(
                      color: white,
                      fontSize: Get.width * 0.07,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  width: Get.width * 0.73,
                  height: 65,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: white.withOpacity(0.1),
                  ),
                  child: Center(
                    child: ListTile(
                      leading: Transform.rotate(
                        child: Icon(
                          Icons.link,
                          color: white.withOpacity(0.5),
                          size: 24,
                        ),
                        angle: -math.pi / 4,
                      ),
                      title: TextFormField(
                        controller: appController.linkController,
                        cursorColor: Colors.white,
                        keyboardType: TextInputType.text,
                        style: chilankaStyle(color: white),
                        decoration: new InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                                left: 15, bottom: 11, top: 11, right: 15),
                            hintText: "paste your link here",
                            hintStyle: chilankaStyle(color: white)),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    appController.parseJsonAndDownload(context);
                  },
                  child: Container(
                      height: 65,
                      width: 65,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: color4,
                      ),
                      child: Center(
                        child: Container(
                          height: 50,
                          width: 50,
                          child: Image.asset("assets/icons/download.png"),
                        ),
                      )),
                )
              ],
            ),
          ),
          Stack(
            children: [
              Positioned(
                child: Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.lightBlue[100],
                  ),
                ),
                top: 20,
                left: 20,
              ),
              Positioned(
                child: Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.lightBlue[100],
                  ),
                ),
                bottom: 10,
                left: Get.width * 0.5,
              ),
              Positioned(
                child: Container(
                  height: 55,
                  width: 55,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.yellow,
                  ),
                ),
                bottom: 75,
                left: Get.width * 0.25,
              ),
              Positioned(
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.lightBlue[100],
                  ),
                ),
                top: 20,
                left: Get.width * 0.8,
              ),
              Positioned(
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.yellow,
                  ),
                ),
                bottom: 20,
                left: Get.width * 0.8,
              ),
              Positioned(
                child: Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.yellow,
                  ),
                ),
                bottom: 20,
                left: 20,
              ),
              Center(
                child: new ClipRect(
                  child: new BackdropFilter(
                    filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                    child: new Container(
                      width: Get.width,
                      height: Get.height * 0.25,
                      alignment: Alignment.centerRight,
                      margin: EdgeInsets.only(right: 45, left: 40),
                      child: Transform.rotate(
                        child: Image.asset("assets/images/rocket.png"),
                        angle: math.pi / 3,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Center(
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  child: ListTile(
                    title: Text(
                      "Fast Service",
                      style: chilankaStyle(
                          color: white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "when this is enabled, once you open the app it will check for links and download",
                      style: chilankaStyle(color: Colors.grey[500]),
                    ),
                    trailing: GFToggle(
                      boxShape: BoxShape.circle,
                      onChanged: (b) async {},
                      enabledTrackColor: color2,
                      type: GFToggleType.ios,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
