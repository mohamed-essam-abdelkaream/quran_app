import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quran/image_assets.dart';
import 'package:quran/shared/Colors/color_manager.dart';
import 'package:quran/shared/cubit/cubit/main_state.dart';
import 'package:quran/shared/cubit/cubit/main_cubit.dart';
import 'package:quran/shared/widget/al_basmala_widget.dart';
import 'package:quran/shared/widget/grid_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return BlocConsumer<MainCubit, MainState>(
      listener: (context, state) {},
      builder: (context, state) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
          ),
          child: Scaffold(
            backgroundColor: ColorsManager.kBackgroundColor,
            extendBody: true,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.transparent,
              elevation: 0,
              leadingWidth: 70,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    padding: const EdgeInsets.only(left: 10),
                    icon: SvgPicture.asset(Assets.imagesMenu),
                    onPressed: () {},
                  ),
                  CircleAvatar(
                    radius: 25,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Image.network(
                        'https://img.freepik.com/free-vector/hand-drawn-flat-design-salat-illustration_23-2149286670.jpg?w=740&t=st=1696751993~exp=1696752593~hmac=d7cbf26e44abb6dd97ae45177fabfe8b76b4b958eef8f6a440ed8e26c40058f1',
                        errorBuilder: (BuildContext context, Object exception,
                            StackTrace? stackTrace) {
                          return const Text(
                            'ooops Error with Image',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 10),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            body: SizedBox(
              width: screenWidth,
              height: screenHeight,
              child: SafeArea(
                bottom: false,
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  primary: true,
                  children: [
                    AlBasmalaWidget(
                      screenHeight: screenHeight,
                      screenWidth: screenWidth,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const ListOfGridWidget(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
