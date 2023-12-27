import 'package:flutter/material.dart';
import 'package:quran/model/video_model.dart';
import 'package:quran/screens/VideoScreen/video_details.dart';
import 'package:quran/shared/Colors/color_manager.dart';

class VideosWidget extends StatelessWidget {
  const VideosWidget(
      {super.key, required this.videoModel, required this.index});
  final VideosModel videoModel;
  final int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return VideoDetailsScreen(
                videosModel: videoModel,
                number: index,
              );
            },
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(17, 32, 149, 100),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          border: Border.all(
            color: ColorsManager.kBlueColor,
          ),
        ),
        child: Text(
          videoModel.videos![index].reciterName ?? '',
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: ColorsManager.kWhiteColor,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
