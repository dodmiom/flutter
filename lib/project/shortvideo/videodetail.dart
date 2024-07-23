import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:day1/project/shortvideo/videoview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VideoDetailPage extends StatelessWidget {
  const VideoDetailPage(
      {super.key,
      required this.itemtitle,
      required this.itemurl,
      required this.itemthumbnail,
      required this.itemdesc});
  final String itemtitle;
  final String itemurl;
  final String itemthumbnail;
  final String itemdesc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Tutorial.com",
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Colors.red[400],
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            VideoView(url: itemurl, dataSourceType: DataSourceType.network),
            SizedBox(
              height: 10,
            ),
            Text(
              itemtitle,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 23,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              itemdesc,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w300),
            )
          ],
        ),
      ),
    );
  }
}
