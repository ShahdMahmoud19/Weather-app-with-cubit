import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:weather_app_cubit/core/theme/text_style.dart';
import 'package:weather_app_cubit/features/Home/models/weather_model.dart';
import 'package:weather_app_cubit/features/Home/screens/home_screen.dart';
import 'package:weather_app_cubit/features/Search/widgets/list_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key, required this.weatherList});
  final List<WeatherResponse> weatherList;

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  List<WeatherResponse> get weatherList => widget.weatherList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 164, 186, 248), Colors.white],
            stops: [0.0, 0.3],
            begin: Alignment.topRight,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: Column(
                children: [
                  Gap(50),
                  SizedBox(
                    width: 350,
                    child: TextField(
                      controller: searchController,
                      style: AppTextStyles.searchField,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        filled: true,
                        fillColor: Color.fromARGB(77, 120, 150, 186),
                        hoverColor: Colors.white,
                        prefixIcon: IconButton(
                          icon: Icon(Icons.search, color: Colors.white),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    HomeScreen(cityName: searchController.text),
                              ),
                            );
                          },
                        ),
                        hintText: ' Enter location ',
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontFamily: 'Kadwa',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  Gap(10),
                  SizedBox(
                    height: 330,
                    child: ListView.separated(
                      itemCount: weatherList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListWidget(
                          country: weatherList[index].location?.name ?? '',
                          temp: '${weatherList[index].current?.tempC ?? '0'}°',
                          subtemp:
                              'AQI 53     ${weatherList[index].forecast?.forecastday?[0].day?.minTempC ?? '0'}° / ${weatherList[index].forecast?.forecastday?[0].day?.maxTempC ?? '0'}° ',
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return Gap(10);
                      },
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              left: 0,
              child: SvgPicture.asset(
                height: 330,
                colorFilter: ColorFilter.linearToSrgbGamma(),
                'assets/images/Group 18.svg',
                semanticsLabel: 'Dart Logo',
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
