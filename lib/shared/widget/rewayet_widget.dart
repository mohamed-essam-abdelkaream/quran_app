import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quran/image_assets.dart';
import 'package:quran/model/riwayat_model.dart';
import 'package:quran/shared/Colors/color_manager.dart';

class RiwayatWidget extends StatelessWidget {
  const RiwayatWidget(
      {super.key, required this.riwayatModel, required this.index});
  final RiwayatModel riwayatModel;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(Assets.imagesIconMuslim),
              Text(
                riwayatModel.riwayat![index].id.toString(),
                style: const TextStyle(
                  color: ColorsManager.kWhiteColor,
                ),
              ),
            ],
          ),
          Expanded(
            child: Text(
              riwayatModel.riwayat![index].name!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: ColorsManager.kWhiteColor,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
