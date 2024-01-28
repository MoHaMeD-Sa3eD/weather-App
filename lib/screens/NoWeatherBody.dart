import 'package:flutter/material.dart';
import 'package:weather_app/screens/SearchScreen.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.brown.shade300,
            Colors.brown.withOpacity(0.2),
          ],
        ),
      ),
      child: const Center(
        child: Text(
          textAlign: TextAlign.center,
          'There is no weather😌\n\n press on 🔍 to search ',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
