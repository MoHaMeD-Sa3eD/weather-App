import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/getWeatherCubit/getWeatherCubit.dart';
import 'package:weather_app/services/watherService.dart';

import '../Models/WeatherModel.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Search a City '),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).primaryColor,
              Theme.of(context).primaryColor.withOpacity(0.4),
            ],
            begin: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: TextField(
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]"))
                ],
              onSubmitted: (String value) async {
                GetWeatherCubit getWeatherCubit =
                    BlocProvider.of<GetWeatherCubit>(context);
                getWeatherCubit.getWeather(cityName: value);
                Navigator.pop(context);
              },
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(35),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                hintText: 'Enter city name ',
                hintStyle: const TextStyle(color: Colors.white),
                labelText: 'Search',
               labelStyle: const TextStyle(color: Colors.white),
                suffixIcon: const Icon(Icons.search,color: Colors.white,),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
