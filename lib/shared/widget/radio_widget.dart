import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quran/image_assets.dart';
import 'package:quran/model/radio_model.dart';
import 'package:quran/shared/Colors/color_manager.dart';

class RadioWidget extends StatefulWidget {
  const RadioWidget({super.key, required this.radioModel, required this.index});
  final RadioModel radioModel;
  final int index;

  @override
  State<RadioWidget> createState() => _RadioWidgetState();
}

class _RadioWidgetState extends State<RadioWidget> {
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
            widget.radioModel.radios![widget.index].name ?? "",
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
                  setState(
                    () {
                      audioPlayer.state == PlayerState.playing
                          ? audioPlayer.pause()
                          : audioPlayer.play(
                              UrlSource(
                                  widget.radioModel.radios![widget.index].url ??
                                      ""),
                            );
                    },
                  );
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
