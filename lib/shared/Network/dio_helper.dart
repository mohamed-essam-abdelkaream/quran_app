import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://mp3quran.net/api/v3/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String? lang = 'eng',
    String? token,
    Map<String, dynamic>? data,
  }) async {
    return await dio.get(
      url,
      queryParameters: query,
      options: Options(),
    );
  }
}
