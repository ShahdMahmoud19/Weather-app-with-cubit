import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:weather_app_cubit/core/theme/text_style.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});
  @override
  State<OnBoarding> createState() => _OnBoardingState();
}
class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 161, 184, 248),
              Color.fromRGBO(255, 255, 255, 1),
            ],
            stops: [0.28, 1.0],
            begin: Alignment.topRight,
            end: Alignment.centerLeft,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            SvgPicture.asset(
              'assets/images/weather.svg',
              semanticsLabel: 'Dart Logo',
            ),
            Text('weather', style: AppTextStyles.largeTitle),
            Text('@wolf', style: AppTextStyles.smallSubtitle),
            Gap(200),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/home');
              },
              child: Container(
                alignment: Alignment.center,
                width: 150,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  gradient: LinearGradient(
                    colors: [
                      const Color.fromARGB(255, 124, 148, 213),
                      const Color.fromRGBO(255, 255, 255, 1),
                    ],
                    stops: [0.63, 1.0],
                    begin: Alignment.centerLeft,
                    end: Alignment.topRight,
                  ),
                ),
                child: Text("let's start", style: AppTextStyles.buttonText),
              ),
            ),
            Gap(30),
          ],
        ),
      ),
    );
  }
}
