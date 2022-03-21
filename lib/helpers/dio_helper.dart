import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:weather_app/Constant/app_constant.dart';
import 'package:weather_app/models/cities_model.dart';

class DioHelper {
  Dio _dio = Dio(
    BaseOptions(
      baseUrl: AppConstant.weatherApiUrl,
    ),
  );

  DioHelper() {
    _dio.interceptors
        .add(LogInterceptor(requestBody: true, responseBody: true));
  }

  Future<Either<String, Cities>> getCities(String? lat, String? lon) async {
    try {
      var response = await _dio.get('/find', queryParameters: {
        'lat': lat ?? -6.5855367,
        'lon': lon ?? 106.8866645,
        'cnt': 4,
        // 'appid': AppConstant.weatherApiKey,
        'units': 'metric',
      });

      if (response.statusCode as int >= 300)
        return Left('Dio:${response.statusMessage}');

      var listCities = Cities.fromJson(response.data);
      return Right(listCities);
    } catch (e) {
      if (e is DioError) {
        return Left('Dio:${e.message}');
      } else {
        return Left('Something Error');
      }
    }
  }
}
