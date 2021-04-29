import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/toggle/gf_toggle.dart';
import 'package:instagram_media_downloader/Configuration/FontFunctions.dart';
import 'package:instagram_media_downloader/Configuration/Pallete.dart';

class SettingsSection extends StatelessWidget {
  const SettingsSection({Key key, this.sc}) : super(key: key);
  final ScrollController sc;

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: sc,
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      children: [
        Container(
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.all(4),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: color2.withOpacity(0.05)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                child: Text(
                  "General",
                  style: chilankaStyle(
                      color: Colors.grey, fontWeight: FontWeight.w800),
                ),
                padding: EdgeInsets.only(left: 16),
              ),
              ListTile(
                leading: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: Image.asset(
                          "assets/icons/folder.png",
                          height: 40,
                          width: 40,
                        ).image,
                        fit: BoxFit.fill),
                  ),
                ),
                title: Text(
                  "Storage Folder",
                  style: chilankaStyle(
                    color: black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: Text("sdcard/InstaDonwloader"),
              ),
              ListTile(
                leading: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: Image.asset(
                          "assets/icons/location.png",
                          height: 40,
                          width: 40,
                        ).image,
                        fit: BoxFit.fill),
                  ),
                ),
                title: Text(
                  "Select your language",
                  style: chilankaStyle(
                    color: black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: Text("English"),
              )
            ],
          ),
        ),
        SizedBox(
          height: Get.height * 0.03,
        ),
        Container(
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.all(4),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: color2.withOpacity(0.05)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                child: Text(
                  "Advanced",
                  style: chilankaStyle(
                      color: Colors.grey, fontWeight: FontWeight.w800),
                ),
                padding: EdgeInsets.only(left: 16),
              ),
              ListTile(
                leading: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: Image.asset(
                          "assets/icons/bell.png",
                          height: 40,
                          width: 40,
                        ).image,
                        fit: BoxFit.fill),
                  ),
                ),
                title: Text(
                  "Notification Bar",
                  style: chilankaStyle(
                    color: black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: Text("Enable app notification bar"),
                trailing: GFToggle(
                  onChanged: (b) {},
                  enabledTrackColor: color1,
                ),
              ),
              ListTile(
                leading: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: Image.asset(
                          "assets/icons/instagram.png",
                          height: 40,
                          width: 40,
                        ).image,
                        fit: BoxFit.fill),
                  ),
                ),
                title: Text(
                  "Enable Fast Service",
                  style: chilankaStyle(
                    color: black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: Text("For a fast usage"),
                trailing: GFToggle(
                  onChanged: (b) {},
                  enabledTrackColor: color1,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Center(
          child: Text(
            "Version 1.0.0",
            style: chilankaStyle(
              color: Colors.grey[500],
              fontWeight: FontWeight.w500,
            ),
          ),
        )
      ],
    );
  }
}
