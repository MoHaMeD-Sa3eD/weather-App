import '../../Models/WeatherModel.dart';

class WeatherStates {}

class NoWeatherState extends WeatherStates {}

class WeatherLoadedState extends WeatherStates {}

class WeatherFaliureState extends WeatherStates {
  final String errMessage;

  WeatherFaliureState({required this.errMessage});
}
