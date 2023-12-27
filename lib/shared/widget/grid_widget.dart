import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran/image_assets.dart';
import 'package:quran/shared/Colors/color_manager.dart';
import 'package:quran/screens/MoshafScreen/moshaf_screen.dart';
import 'package:quran/screens/RadioScreen/radio_screen.dart';
import 'package:quran/screens/RecitersScreen/reciters_screen.dart';
import 'package:quran/screens/RiwayatScreen/rewayat_screen.dart';
import 'package:quran/screens/TafasirScreen/tafasir_screen.dart';
import 'package:quran/screens/VideoScreen/video_screen.dart';
import 'package:quran/shared/components/navigator.dart';

class GridWidget extends StatelessWidget {
  const GridWidget({
    super.key,
    required this.titleAR,
    required this.titleEN,
    required this.function,
  });
  final String titleAR;
  final String titleEN;
  final void Function() function;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          function();
        },
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SvgPicture.asset(
              Assets.imagesLogo,
              height: 135,
              width: 135,
            ),
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(11),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    ColorsManager.kGreenColor,
                    ColorsManager.kBlueColor.withOpacity(0.2),
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    titleAR,
                    style: const TextStyle(
                      fontSize: 23,
                      color: ColorsManager.kWhiteColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    titleEN,
                    style: const TextStyle(
                      fontSize: 23,
                      color: ColorsManager.kWhiteColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListOfGridWidget extends StatelessWidget {
  const ListOfGridWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            GridWidget(
              titleAR: 'سورة',
              titleEN: 'Surah',
              function: () {
                navigateTo(context, const MoshafScreen());
              },
            ),
            const SizedBox(
              width: 30,
            ),
            GridWidget(
              titleAR: 'راديو',
              titleEN: 'Radio',
              function: () {
                navigateTo(context, const RadioScreen());
              },
            ),
          ],
        ),
        const SizedBox(
          height: 42,
        ),
        Row(
          children: [
            GridWidget(
              titleAR: 'روايات',
              titleEN: 'Rewayat',
              function: () {
                navigateTo(context, const RiwayatScreen());
              },
            ),
            const SizedBox(
              width: 30,
            ),
            GridWidget(
              titleAR: 'تفسير',
              titleEN: 'Tafasir',
              function: () {
                navigateTo(context, const TafasirScreen());
              },
            ),
          ],
        ),
        const SizedBox(
          height: 42,
        ),
        Row(
          children: [
            GridWidget(
              titleAR: 'القراء',
              titleEN: 'Reciters',
              function: () {
                navigateTo(context, const RecitersScreen());
              },
            ),
            const SizedBox(
              width: 30,
            ),
            GridWidget(
              titleAR: 'فيديوهات',
              titleEN: 'Videos',
              function: () {
                navigateTo(context, const VideoScreen());
              },
            ),
          ],
        ),
        const SizedBox(
          height: 42,
        ),
      ],
    );
  }
}
