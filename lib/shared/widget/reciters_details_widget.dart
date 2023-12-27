import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran/image_assets.dart';
import 'package:quran/model/reciters_model.dart';
import 'package:quran/shared/Colors/color_manager.dart';
import 'package:quran/shared/components/launcher.dart';

class RecitersDetailsWidget extends StatelessWidget {
  const RecitersDetailsWidget({
    super.key,
    required this.recitersModel,
    required this.index,
    required this.number,
  });
  final RecitersModel recitersModel;
  final int index;
  final int number;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        urlLauncher(
          Uri.parse(recitersModel.reciters![number].moshaf![index].server!),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
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
        child: Row(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset(Assets.imagesIconMuslim),
                Text(
                  recitersModel.reciters![number].moshaf![index].id.toString(),
                  style: const TextStyle(
                    color: ColorsManager.kWhiteColor,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Text(
                recitersModel.reciters![number].moshaf![index].name!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: ColorsManager.kWhiteColor,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
