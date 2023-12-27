import 'package:flutter/material.dart';
import 'package:quran/shared/cubit/cubit/main_cubit.dart';
import 'package:quran/shared/widget/ayah_widget.dart';

class AyatListView extends StatelessWidget {
  const AyatListView({
    super.key,
    required this.mainCubit,
    required this.number,
  });

  final MainCubit mainCubit;
  final int number;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return AyahWidget(
          surahs: mainCubit.ayatModel!,
          index: index,
          number: number,
        );
      },
      itemCount: mainCubit.ayatModel!.data!.surah![number].ayahs!.length,
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          height: 60,
        );
      },
    );
  }
}
