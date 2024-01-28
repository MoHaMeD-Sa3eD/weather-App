import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/getWeatherCubit/getWeatherCubit.dart';
import 'package:weather_app/cubits/getWeatherCubit/getWeatherStates.dart';
import 'package:weather_app/screens/SearchScreen.dart';
import 'package:weather_app/screens/WeatherBody.dart';

import 'NoWeatherBody.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const SearchScreen();
                  }));
                },
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                )),
          )
        ],
      //  elevation: 100,
        centerTitle: true,
        title: const Text(
          'Weather App',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherStates>(
        builder: (context, weatherState) {
          if (weatherState is NoWeatherState) {
            return const NoWeatherBody();
          } else if (weatherState is WeatherLoadedState) {
            return  WeatherBody();
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  color: Colors.grey.shade500,
                  child: const Text(
                    textAlign: TextAlign.center,
                    'oops,\nthere was an error,\nplease try again',
                    style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const SearchScreen();
                      }));
                    },
                    icon: const Icon(
                      Icons.restart_alt_rounded,
                      size: 50,
                      color: Colors.blue,
                    ))
              ],
            );
          }
        },
      ),
    );
  }
}
