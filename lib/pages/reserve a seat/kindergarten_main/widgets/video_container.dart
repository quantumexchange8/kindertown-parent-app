import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kindertown_parent_app/component/primary_container.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:video_player/video_player.dart';

class VideoContainer extends StatefulWidget {
  final String? videoAddress;
  const VideoContainer({super.key, required this.videoAddress});

  @override
  State<VideoContainer> createState() => _VideoContainerState();
}

class _VideoContainerState extends State<VideoContainer> {
  FlickManager? flickManager;

  @override
  void initState() {
    super.initState();
    if (widget.videoAddress != null) {
      flickManager = FlickManager(
        videoPlayerController:
            VideoPlayerController.networkUrl(Uri.parse(widget.videoAddress!)),
      );
    }
  }

  @override
  void dispose() {
    flickManager?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PrimaryContainer(
      padding:
          EdgeInsets.symmetric(vertical: height24, horizontal: width10 * 2.2),
      child: Container(
        decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            image: widget.videoAddress == null
                ? null
                : const DecorationImage(
                    image: AssetImage('assets/images/video_unavailable.png'))),
        child: flickManager != null
            ? FlickVideoPlayer(
                flickManager: flickManager!,
              )
            : null,
      ),
    );
  }
}
