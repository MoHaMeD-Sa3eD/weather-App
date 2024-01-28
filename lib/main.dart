import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/getWeatherCubit/getWeatherCubit.dart';
import 'package:weather_app/cubits/getWeatherCubit/getWeatherStates.dart';
import 'package:weather_app/screens/HomeScreen.dart';

import 'Theme/getThemeColorMethod.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetWeatherCubit>(
      create: (BuildContext context) => GetWeatherCubit(),
      child: BlocBuilder<GetWeatherCubit, WeatherStates>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primaryColor: getThemeColor(
                  condition: BlocProvider.of<GetWeatherCubit>(context)
                      .weatherModel
                      ?.condition),
            ),
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}
