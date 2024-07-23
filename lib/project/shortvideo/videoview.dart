import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class VideoView extends StatefulWidget {
  const VideoView({super.key, required this.url, required this.dataSourceType});
  final String url;
  final DataSourceType dataSourceType;

  @override
  State<VideoView> createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
  late VideoPlayerController _controller;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    switch (widget.dataSourceType) {
      case DataSourceType.asset:
        _controller = VideoPlayerController.asset(widget.url);
        break;

      case DataSourceType.contentUri:
        _controller = VideoPlayerController.contentUri(Uri.parse(widget.url));
        break;
      case DataSourceType.file:
        _controller = VideoPlayerController.file(File(widget.url));
        break;
      case DataSourceType.network:
        _controller = VideoPlayerController.network(widget.url);
        break;
      // TODO: Handle this case.
    }
    _chewieController = ChewieController(
      videoPlayerController: _controller,
      aspectRatio: 16 / 9,
      autoPlay: true,
      looping: true,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 16 / 9,
          child: Chewie(controller: _chewieController),
        ),
      ],
    );
  }
}
