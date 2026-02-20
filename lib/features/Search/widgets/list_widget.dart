import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:weather_app_cubit/core/theme/text_style.dart';

class ListWidget extends StatelessWidget {
  final String country;
  final String temp;
  final String subtemp;
  const ListWidget({
    super.key,
    required this.country,
    required this.temp,
    required this.subtemp,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        width: 370,
        height: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 143, 155, 184),
              Color.fromARGB(77, 141, 176, 219),
            ],
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 15,
                children: [
                  Text(country, style: AppTextStyles.buttonText),
                  Text(subtemp, style: AppTextStyles.subtemb),
                ],
              ),
            ),
            Gap(95),
            Text(temp, style: AppTextStyles.searchTemb),
          ],
        ),
      ),
    );
  }
}
