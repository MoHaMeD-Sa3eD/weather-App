class WeatherModel {
  final String cityName;
  final DateTime date;
  final double minTemp;

  final double maxTemp;

  final double avgTemp;

  final String condition;
  final String image;

  const WeatherModel(
      {required this.cityName,
      required this.date,
      required this.image,
      required this.minTemp,
      required this.maxTemp,
      required this.avgTemp,
      required this.condition});

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      cityName: json["location"]["name"],
      date: DateTime.parse(json["current"]["last_updated"]),
      image: json["forecast"]["forecastday"][0]["day"]["condition"]["icon"],
      minTemp: json["forecast"]["forecastday"][0]["day"]["mintemp_c"],
      maxTemp: json["forecast"]["forecastday"][0]["day"]["maxtemp_c"],
      avgTemp: json["forecast"]["forecastday"][0]["day"]["avgtemp_c"],
      condition: json["forecast"]["forecastday"][0]["day"]["condition"]["text"],
    );
  }
}
