import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_media_downloader/Controllers/AppController.dart';
import 'package:instagram_media_downloader/Models/InstaUserModel.dart';
import 'package:instagram_media_downloader/Models/PostModel.dart';
import 'package:instagram_media_downloader/Widgets/PostWidget.dart';

class DownloadsSection extends StatelessWidget {
  DownloadsSection({Key key, this.sc}) : super(key: key);
  final ScrollController sc;

  final appController = Get.put(AppController());
  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView.builder(
          controller: sc,
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemCount: appController.dbController.posts.length,
          itemBuilder: (BuildContext context, int index) {
            PostModel postModel = appController.dbController.posts[index];
            InstaUserModel userModel = appController.dbController.users
                .where((user) =>
                    user.id == appController.dbController.posts[index].ownerId)
                .first;
            return PostWidget(
              post: postModel,
              user: userModel,
              onShare: () {
                appController.getFile(postModel.isVideo
                    ? "${postModel.shortcode}.mp4"
                    : "${postModel.shortcode}.jpg");
              },
              onDelete: () {
                appController.dbController.deletePost(postModel);
              },
            );
          },
        ));
  }
}
