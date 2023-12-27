import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran/image_assets.dart';
import 'package:quran/model/ayat_model.dart';
import 'package:quran/shared/Colors/color_manager.dart';
import 'package:quran/shared/cubit/cubit/main_cubit.dart';

class SurahNameWidget extends StatelessWidget {
  const SurahNameWidget({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required this.surahs,
    required this.number,
    required this.mainCubit,
  });

  final double screenHeight;
  final double screenWidth;
  final AyatModel surahs;
  final int number;
  final MainCubit mainCubit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight * .3,
      child: Stack(
        children: [
          Positioned(
            top: screenHeight * .08,
            child: Stack(
              alignment: Alignment.center,
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
                Positioned(
                  left: screenWidth * .04,
                  child: SvgPicture.asset(
                    Assets.imagesQuran,
                    fit: BoxFit.fitHeight,
                    width: screenWidth * .4,
                  ),
                ),
                Positioned(
                  right: screenWidth * .04,
                  child: Column(
                    children: [
                      Text(
                        surahs.data!.surah![number].name ?? '',
                        style: const TextStyle(
                          fontSize: 24,
                          color: ColorsManager.kWhiteColor,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        surahs.data!.surah![number].englishNameTranslation ??
                            '',
                        style: const TextStyle(
                          fontSize: 15,
                          color: ColorsManager.kWhiteColor,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            surahs.data!.surah![number].revelationType
                                    ?.toUpperCase() ??
                                '',
                            style: const TextStyle(
                              fontSize: 15,
                              color: ColorsManager.kWhiteColor,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 5,
                            ),
                            width: 5,
                            height: 5,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: ColorsManager.kGreyColor,
                            ),
                          ),
                          Text(
                            "${mainCubit.ayatModel!.data!.surah![number].ayahs!.length.toString()} verses"
                                .toUpperCase(),
                            style: const TextStyle(
                              fontSize: 15,
                              color: ColorsManager.kWhiteColor,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                    ],
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
