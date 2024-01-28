import '../Models/WeatherModel.dart';
import 'package:dio/dio.dart';

class WeatherService {
  final Dio dio;
  final String domain = 'https://api.weatherapi.com';
  final String path = 'v1/forecast.json';

  final String apiKey = 'ebcff29bb2bc4296811150143241701';

  WeatherService({required this.dio});

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response =
          await dio.get('$domain/$path?key=$apiKey&q=$cityName&days=1');
      Map<String, dynamic> jsonData = response.data;
      WeatherModel weatherModel = WeatherModel.fromJson(jsonData);
      return weatherModel;
    } on DioException catch (e) {
      final String error = e.response?.data['error']['message'] ?? 'oops there was an error , try again ';
      throw Exception(error);
    } catch (e) {
      throw Exception('ooops there was an error ,try later');
    }
  }
}
