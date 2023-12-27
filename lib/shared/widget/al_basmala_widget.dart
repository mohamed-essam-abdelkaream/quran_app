import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran/image_assets.dart';
import 'package:quran/shared/Colors/color_manager.dart';

class AlBasmalaWidget extends StatelessWidget {
  const AlBasmalaWidget({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
  });

  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight * .4,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            top: screenHeight * -.04,
            child: SvgPicture.asset(
              Assets.imagesLogo,
              width: screenWidth * .8,
            ),
          ),
          Positioned(
            top: screenHeight * .17,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  width: screenWidth * .9,
                  height: screenHeight * .2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11),
                    gradient: const LinearGradient(
                      colors: [
                        ColorsManager.kGreenColor,
                        ColorsManager.kBlueColor,
                      ],
                    ),
                  ),
                ),
                SvgPicture.asset(Assets.imagesVector),
                Positioned(
                  top: screenHeight * .08,
                  child: SvgPicture.asset(
                    Assets.imagesAlBasmala,
                    fit: BoxFit.fitHeight,
                    width: screenWidth * .6,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
