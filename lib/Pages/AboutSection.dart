import 'package:flutter/material.dart';
import 'package:instagram_media_downloader/Configuration/FontFunctions.dart';
import 'package:instagram_media_downloader/Configuration/Pallete.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({Key key, this.sc}) : super(key: key);
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
            "Made with flutter and love",
            style: chilankaStyle(
              color: color1,
              fontSize: 24,
            ),
          ),
        ),
        SizedBox(height: 20),
        Center(
            child: FlutterLogo(
          size: 120,
        )),
        SizedBox(height: 20),
        Center(
          child: Text(
            "Design inspiration by\n",
            style: chilankaStyle(
              color: color1,
              fontSize: 24,
            ),
          ),
        ),
        Center(
          child: Text(
            "Mohammad Reza Farahzad\n",
            style: chilankaStyle(
              color: color2,
              fontSize: 24,
            ),
          ),
        ),
        Center(
          child: Text(
            "@mrfarahzad\n",
            style: chilankaStyle(
              color: color2,
              fontSize: 24,
            ),
          ),
        )
      ],
    );
  }
}
