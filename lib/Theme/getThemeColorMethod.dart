import 'package:flutter/material.dart';

MaterialColor getThemeColor({required String? condition}) {
  if (condition == null) {
    return Colors.brown;
  }
  switch (condition) {
    case "Sunny":
      return Colors.orange;
    case "Cloudy":
    case "Partly cloudy":
    case "Overcast":
    case "Mist":
      return Colors.grey;
    case "Patchy rain possible":
    case "Patchy snow possible":
    case "Patchy sleet possible":
    case "Patchy freezing drizzle possible":
    case "Patchy light drizzle":
    case "Light drizzle":
    case "Freezing drizzle":
    case "Heavy freezing drizzle":
    case "Patchy light rain":
    case "Light rain":
    case "Moderate rain at times":
    case "Moderate rain":
    case "Heavy rain at times":
    case "Heavy rain":
    case "Light freezing rain":
    case "Moderate or heavy freezing rain":
      return Colors.cyan;
    case "Thundery outbreaks possible":
    case "Patchy light rain with thunder":
    case "Moderate or heavy rain with thunder":
    case "Patchy light snow with thunder":
    case "Moderate or heavy snow with thunder":
      return Colors.deepPurple;
    case "Blowing snow":
    case "Blizzard":
      return Colors.grey;
    case "Fog":
    case "Freezing fog":
      return Colors.grey;
    case "Light sleet":
    case "Moderate or heavy sleet":
    case "Light sleet showers":
    case "Moderate or heavy sleet showers":
      return Colors.blueGrey;
    case "Patchy light snow":
    case "Light snow":
    case "Patchy moderate snow":
    case "Moderate snow":
    case "Patchy heavy snow":
    case "Heavy snow":
    case "Light snow showers":
    case "Moderate or heavy snow showers":
      return Colors.lightBlue;
    case "Ice pellets":
    case "Light rain shower":
    case "Moderate or heavy rain shower":
    case "Torrential rain shower":
    case "Light showers of ice pellets":
    case "Moderate or heavy showers of ice pellets":
      return Colors.lightBlue;
    default:
      return Colors.blue;
  }
}