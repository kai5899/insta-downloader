import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:instagram_media_downloader/Configuration/FontFunctions.dart';
import 'package:instagram_media_downloader/Configuration/Pallete.dart';
import 'package:instagram_media_downloader/Models/InstaUserModel.dart';
import 'package:instagram_media_downloader/Models/PostModel.dart';

class PostWidget extends StatelessWidget {
  PostWidget({this.post, this.user, this.onShare, this.onDelete});
  final PostModel post;
  final InstaUserModel user;
  final Function onShare;
  final Function onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
      padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.grey.withOpacity(0.1),
      ),
      child: Column(
        children: [
          ListTile(
            leading: GFAvatar(
              backgroundColor: Colors.red,
              radius: 24,
              backgroundImage: Image.network("${user.profilePicUrl}").image,
            ),
            title: Text(
              "${user.fullName}",
              style: chilankaStyle(color: color1, fontWeight: FontWeight.bold),
            ),
            subtitle: Text("@${user.username}"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  child: Container(
                    height: 40,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border:
                            Border.all(style: BorderStyle.solid, width: 0.5)),
                    child: Center(
                      child: Icon(
                        Icons.share_outlined,
                        color: black,
                      ),
                    ),
                  ),
                  onTap: () {
                    onShare();
                  },
                ),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  child: Container(
                    height: 40,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border:
                            Border.all(style: BorderStyle.solid, width: 0.5)),
                    child: Center(
                      child: Icon(
                        Icons.delete,
                        color: black,
                      ),
                    ),
                  ),
                  onTap: () {
                    onDelete();
                  },
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.all(16),
            height: Get.height * 0.3,
            width: Get.width * 0.85,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(25),
              image: DecorationImage(
                  image: Image.network('${post.displayUrl}').image,
                  fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ExpandablePanel(
            header: Container(
              child: Text(
                "Click to view post's caption.",
                style: chilankaStyle(
                    color: color2, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              width: Get.width * 0.75,
              padding: EdgeInsets.only(left: 8, right: 8),
              margin: EdgeInsets.only(left: 16, right: 16),
            ),
            theme: ExpandableThemeData(
              headerAlignment: ExpandablePanelHeaderAlignment.center,
              iconSize: 24,
              iconColor: color2,
            ),
            // collapsed: Container(
            //   child: Text(post.caption),
            // ),
            expanded: Container(
              child: Text(post.caption),
              width: Get.width * 0.75,
              padding: EdgeInsets.only(left: 8, right: 8),
              margin: EdgeInsets.only(left: 16, right: 16),
            ),
          )
        ],
      ),
    );
  }
}
