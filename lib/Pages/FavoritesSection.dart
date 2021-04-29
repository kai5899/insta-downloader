import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_media_downloader/Configuration/FontFunctions.dart';
import 'package:instagram_media_downloader/Configuration/Pallete.dart';

class FavoritesSection extends StatelessWidget {
  const FavoritesSection({Key key, this.sc}) : super(key: key);
  final ScrollController sc;

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: sc,
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      children: [
        Center(
          child: Text(
            "No Favorites yet!",
            style: chilankaStyle(
                color: color2, fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        Icon(
          Icons.star,
          size: Get.width,
          color: Colors.amber,
        ),
      ],
    );
  }
}
