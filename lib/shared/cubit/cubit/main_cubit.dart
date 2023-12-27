import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/model/ayat_model.dart';
import 'package:quran/model/radio_model.dart';
import 'package:quran/model/reciters_model.dart';
import 'package:quran/model/riwayat_model.dart';
import 'package:quran/model/surah_model.dart';
import 'package:quran/model/tafasir_model.dart';
import 'package:quran/model/video_model.dart';
import 'package:quran/shared/Network/dio_helper.dart';
import 'package:quran/shared/Network/end_points.dart';
import 'package:quran/shared/cubit/cubit/main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainCubitInitial());
  static MainCubit get(context) => BlocProvider.of(context);

  SurahModel? surahModel;
  void getSurahEN() {
    emit(GetSurahLoading());
    DioHelper.getData(
      url: "$surah?language=eng",
    ).then((value) {
      surahModel = SurahModel.fromJson(value.data);
      emit(GetSurahSuccess());
    }).catchError((error) {
      emit(GetSurahError(error.toString()));
    });
  }

  RiwayatModel? riwayatModel;
  void getRiwayat() {
    emit(GetRiwayatLoading());
    DioHelper.getData(
      url: rewayah,
    ).then((value) {
      riwayatModel = RiwayatModel.fromJson(value.data);
      emit(GetRiwayatSuccess());
    }).catchError((error) {
      emit(GetRiwayatError(error.toString()));
    });
  }

  TafasirModel? tafasirModel;
  void getTafasir() {
    emit(GetTafasirLoading());
    DioHelper.getData(
      url: tafasir,
    ).then((value) {
      tafasirModel = TafasirModel.fromJson(value.data);
      emit(GetTafasirSuccess());
    }).catchError((error) {
      emit(GetTafasirError(error.toString()));
    });
  }

  VideosModel? videosModel;
  void getVideo() async {
    emit(GetVideosLoading());
    await DioHelper.getData(
      url: videos,
    ).then((value) {
      videosModel = VideosModel.fromJson(value.data);
      emit(GetVideosSuccess());
    }).catchError((error) {
      emit(GetVideosError(error.toString()));
    });
  }

  RadioModel? radioModel;
  void getRadio() async {
    emit(GetRadioLoading());
    await DioHelper.getData(
      url: radio,
    ).then((value) {
      radioModel = RadioModel.fromJson(value.data);
      emit(GetRadioSuccess());
    }).catchError((error) {
      emit(GetRadioError(error.toString()));
    });
  }

  Dio dio = Dio();

  AyatModel? ayatModel;
  void getQuran() {
    emit(GetQuranLoading());
    dio.get('http://api.alquran.cloud/v1/quran/ar.alafasy').then((value) {
      ayatModel = AyatModel.fromJson(value.data);
      emit(GetQuranSuccess());
    }).catchError((error) {
      emit(GetQuranError(error.toString()));
    });
  }

  RecitersModel? recitersModel;
  void getReciters() {
    emit(GetRecitersLoading());
    dio.get('https://mp3quran.net/api/v3/reciters?language=ar').then((value) {
      recitersModel = RecitersModel.fromJson(value.data);
      emit(GetRecitersSuccess());
    }).catchError((error) {
      emit(GetRecitersError(error.toString()));
    });
  }
}
