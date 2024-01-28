import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:dio/dio.dart';
import 'package:weather_app/cubits/getWeatherCubit/getWeatherStates.dart';
import '../../Models/WeatherModel.dart';
import '../../services/watherService.dart';

class GetWeatherCubit extends Cubit<WeatherStates> {
  late WeatherModel weatherModel;
  GetWeatherCubit() : super(NoWeatherState());

  getWeather({required String cityName}) async {
    try {
       weatherModel = await WeatherService(dio: Dio())
          .getCurrentWeather(cityName: cityName);

      emit(WeatherLoadedState());
    } catch (e) {
      emit(WeatherFaliureState(errMessage: e.toString()));
    }
  }
}
