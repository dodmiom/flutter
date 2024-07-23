import 'package:audioplayers/audioplayers.dart';
import 'package:day1/project/mp3/providermp3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class Mp3Play extends StatefulWidget {
  const Mp3Play({super.key});

  @override
  State<Mp3Play> createState() => _Mp3PlayState();
}

class _Mp3PlayState extends State<Mp3Play> {
  String formatTime(Duration duration) {
    String twodigitSecond =
        duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    String formattedTime = "${duration.inMinutes}:$twodigitSecond";
    return formattedTime;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Mp3provider>(builder: (context, value, child) {
      final playlist = value.playlist;
      final currentsong = playlist[value.currentSongIndex ?? 0];
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_rounded),
            onPressed: () {},
          ),
          title: Icon(
            Icons.music_note_rounded,
            color: Colors.black,
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {},
            ),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(left: 50.0, right: 50.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.white),
              height: MediaQuery.of(context).size.height * 0.5,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.network(
                  currentsong.audiopic,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              color: const Color.fromARGB(255, 255, 255, 255),
              height: MediaQuery.of(context).size.height * 0.15,
              child: Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        currentsong.Name,
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.08,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 0, 248, 153)),
                      ),
                      Text(
                        currentsong.artistname,
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.03,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              color: const Color.fromARGB(255, 255, 255, 255),
              height: MediaQuery.of(context).size.height * 0.05,
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        (formatTime(value.currentDuration)),
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.05,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                      Text(
                        formatTime(value.totalDuration),
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.05,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              color: const Color.fromARGB(255, 255, 255, 255),
              height: MediaQuery.of(context).size.height * 0.1,
              child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 0)),
                child: Slider(
                  min: 0,
                  max: value.totalDuration.inSeconds.toDouble(),
                  value: value.currentDuration.inSeconds.toDouble(),
                  activeColor: Color.fromARGB(255, 0, 248, 153),
                  onChanged: (double double) {},
                  onChangeEnd: (double double) {
                    value.seek(Duration(seconds: double.toInt()));
                  },
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              color: Color.fromARGB(255, 243, 241, 241),
              height: MediaQuery.of(context).size.height * 0.15,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.favorite,
                        color: Color.fromARGB(255, 245, 56, 43),
                        size: MediaQuery.of(context).size.width * 0.05,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(CupertinoIcons.backward_end_fill,
                          size: MediaQuery.of(context).size.width * 0.05),
                      onPressed: () {
                        value.playPreviousSong;
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        CupertinoIcons.pause_circle_fill,
                        color: Color.fromARGB(255, 0, 248, 153),
                        size: MediaQuery.of(context).size.width * 0.1,
                      ),
                      onPressed: () {
                        value.pausedOrresume;
                      },
                    ),
                    IconButton(
                        icon: Icon(CupertinoIcons.forward_end_fill,
                            size: MediaQuery.of(context).size.width * 0.05),
                        onPressed: () {
                          value.playNextSong;
                        }),
                    IconButton(
                      icon: Icon(CupertinoIcons.tray_arrow_down,
                          size: MediaQuery.of(context).size.width * 0.05),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
