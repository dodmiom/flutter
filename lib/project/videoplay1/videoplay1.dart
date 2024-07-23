import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:appinio_video_player/appinio_video_player.dart';

enum Source { Asset, Network }

class Videoplay1 extends StatefulWidget {
  const Videoplay1({super.key});

  @override
  State<Videoplay1> createState() => _Videoplay1State();
}

class _Videoplay1State extends State<Videoplay1> {
  late CustomVideoPlayerController _customVideoPlayerController;
  Source currentsource = Source.Asset;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    intializeplayer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomVideoPlayer(
            customVideoPlayerController: _customVideoPlayerController,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MaterialButton(
                onPressed: () {
                  setState(() {
                    currentsource = Source.Network;
                  });
                },
                color: Colors.red,
                child: Text(
                  "Network",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              MaterialButton(
                onPressed: () {
                  setState(() {
                    currentsource = Source.Network;
                    intializeplayer();
                  });
                },
                color: Colors.red,
                child: Text(
                  "Asset",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  void intializeplayer(Source source) {
    CachedVideoPlayerController _videoPlayerController;

    if (source == Source.Asset) {
      _videoPlayerController = CachedVideoPlayerController.asset(dataSource)
        ..initialize().then((value) => {setState(() {})});
    } else if (source == Source.Asset) {
      _videoPlayerController = CachedVideoPlayerController.asset(dataSource)
        ..initialize().then((value) => {setState(() {})});
    } else {
      return;
    }
    _videoPlayerController = CachedVideoPlayerController.asset(longVideo)
      ..initialize().then((value) => setState(() {}));
    _customVideoPlayerController = CustomVideoPlayerController(
        context: context, videoPlayerController: _videoPlayerController);
  }
}
