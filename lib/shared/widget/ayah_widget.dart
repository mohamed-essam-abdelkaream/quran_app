import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran/image_assets.dart';
import 'package:quran/model/ayat_model.dart';
import 'package:quran/shared/Colors/color_manager.dart';
import 'package:share_plus/share_plus.dart';

class AyahWidget extends StatefulWidget {
  const AyahWidget({
    super.key,
    required this.surahs,
    required this.index,
    required this.number,
  });
  final AyatModel surahs;
  final int index;
  final int number;

  @override
  State<AyahWidget> createState() => _AyahWidgetState();
}

class _AyahWidgetState extends State<AyahWidget> {
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(17, 32, 149, 100),
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            border: Border.all(
              color: ColorsManager.kBlueColor,
            ),
          ),
          child: Row(
            children: [
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(
                  horizontal: 5,
                ),
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorsManager.kGreenColor,
                ),
                child: Text(
                  widget.surahs.data!.surah![widget.number].ayahs![widget.index]
                      .number
                      .toString(),
                  style: const TextStyle(
                    color: ColorsManager.kBlackColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  Share.share(
                      "الآيه: ${widget.surahs.data!.surah![widget.number].ayahs![widget.index].text ?? ''}\n الصوت:  ${widget.surahs.data!.surah![widget.number].ayahs![widget.index].audio ?? ""} \n تحميل البرنامج:  https://github.com/HusseinMohamed99/Moshaf_App/releases/download/v1.0.0/QURAN.KAREEM.V4.apk");
                },
                icon: SvgPicture.asset(Assets.imagesShare),
              ),
              IconButton(
                onPressed: () {
                  setState(
                    () {
                      audioPlayer.play(
                        UrlSource(widget.surahs.data!.surah![widget.number]
                                .ayahs![widget.index].audio ??
                            ""),
                      );
                    },
                  );
                },
                icon: SvgPicture.asset(
                  audioPlayer.state == PlayerState.playing
                      ? Assets.imagesPauseIcon
                      : Assets.imagesPlay,
                  color: ColorsManager.kGreenColor,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(Assets.imagesSave),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          widget.surahs.data!.surah![widget.number].ayahs![widget.index].text ??
              '',
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: ColorsManager.kWhiteColor,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
