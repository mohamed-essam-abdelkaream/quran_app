import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran/image_assets.dart';
import 'package:quran/model/tafasir_model.dart';
import 'package:quran/shared/Colors/color_manager.dart';

class TafasirWidget extends StatefulWidget {
  const TafasirWidget({
    super.key,
    required this.tafasirModel,
    required this.index,
  });
  final TafasirModel tafasirModel;
  final int index;

  @override
  State<TafasirWidget> createState() => _TafasirWidgetState();
}

class _TafasirWidgetState extends State<TafasirWidget> {
  late AudioPlayer audioPlayer;

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
  }

  @override
  void dispose() {
    super.dispose();
    audioPlayer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            widget.tafasirModel.tafasir!.soar![widget.index].name ?? "",
            style:
                const TextStyle(color: ColorsManager.kWhiteColor, fontSize: 20),
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  audioPlayer.pause();
                },
                icon: SvgPicture.asset(
                  Assets.imagesIconMetro,
                  color: ColorsManager.kWhiteColor,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    audioPlayer.state == PlayerState.playing
                        ? audioPlayer.pause()
                        : audioPlayer.play(
                            UrlSource(widget.tafasirModel.tafasir!
                                    .soar![widget.index].url ??
                                ""),
                          );
                  });
                },
                icon: SvgPicture.asset(
                  audioPlayer.state == PlayerState.playing
                      ? Assets.imagesPauseIcon
                      : Assets.imagesIconPlay,
                  color: ColorsManager.kWhiteColor,
                ),
              ),
              IconButton(
                onPressed: () async {
                  audioPlayer.pause();
                },
                icon: SvgPicture.asset(
                  Assets.imagesIconMetroNext,
                  color: ColorsManager.kWhiteColor,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
