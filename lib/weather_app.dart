import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_cubit/features/Home/cubit/home_cubit.dart';
import 'package:weather_app_cubit/features/Home/screens/home_screen.dart';
import 'package:weather_app_cubit/features/onBoarding/on_boarding.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {'/home': (context) => HomeScreen(cityName: 'cairo')},
        home: OnBoarding(),
      ),
    );
  }
}
