import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:liquid_glass_renderer/liquid_glass_renderer.dart';
import 'package:weather_app_cubit/core/theme/text_style.dart';
import 'package:weather_app_cubit/features/Home/cubit/home_cubit.dart';
import 'package:weather_app_cubit/features/Home/models/weather_model.dart';
import 'package:weather_app_cubit/features/Search/search_screen.dart';

class HomeScreen extends StatefulWidget {
  final String cityName;
  const HomeScreen({super.key, required this.cityName});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  WeatherResponse? weatherResponse;

  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getData(widget.cityName);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is HomeError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.error)));
        } else if (state is HomeSuccess) {
          weatherResponse = state.weatherResponse;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Data loaded successfully'),
              duration: Duration(milliseconds: 200),
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: state is HomeLoading
              ? Center(child: CircularProgressIndicator())
              : state is HomeSuccess
              ? Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(state.image ?? ''),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Gap(35),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SearchScreen(
                                    weatherList: state.weatherList,
                                  ),
                                ),
                              );
                            },
                            icon: Icon(
                              Icons.search,
                              color: Colors.black,
                              size: 35,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        state.weatherResponse.location?.name ?? '',
                        style: AppTextStyles.mediumTitle,
                      ),
                      Gap(45),
                      Text(
                        '${state.weatherResponse.current?.tempC ?? '0'}°',
                        style: AppTextStyles.temperature,
                      ),
                      Text(
                        '${state.weatherResponse.current?.condition?.text ?? ''} '
                        ' '
                        '${state.weatherResponse.forecast?.forecastday?[0].day?.minTempC ?? ''}° / ${state.weatherResponse.forecast?.forecastday?[0].day?.maxTempC ?? ''}°',
                        style: AppTextStyles.weatherDetails,
                      ),
                      LiquidGlassLayer(
                        settings: LiquidGlassSettings(
                          visibility: 0.75,
                          thickness: 20,
                          glassColor: Colors.white.withValues(alpha: 0.5),
                        ),
                        child: LiquidGlass(
                          shape: LiquidRoundedSuperellipse(borderRadius: 50),
                          child: Container(
                            padding: EdgeInsets.all(4),
                            width: 116,
                            height: 39,
                            child: Text('🌿 AQI 53', style: AppTextStyles.aqi),
                          ),
                        ),
                      ),
                      Spacer(),
                      LiquidGlassLayer(
                        settings: LiquidGlassSettings(
                          visibility: 0.75,
                          thickness: 2,
                          blur: 5,
                          glassColor: Colors.white.withValues(alpha: 0.3),
                        ),
                        child: LiquidGlass(
                          shape: LiquidRoundedSuperellipse(borderRadius: 30),
                          child: Container(
                            padding: EdgeInsets.all(13),
                            width: 370,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  '5-day forecast                   More details ‣ ',
                                  style: AppTextStyles.forecastHeader,
                                ),
                                Gap(27),
                                Text(
                                  '🌤️ Mon  ${state.weatherResponse.current?.condition?.text ?? ''} '
                                  '${state.weatherResponse.forecast?.forecastday?[1].day?.minTempC ?? ''}° / ${state.weatherResponse.forecast?.forecastday?[1].day?.maxTempC ?? ''}°',
                                  style: AppTextStyles.forecastDetails,
                                ),
                                Gap(14),
                                Text(
                                  '☀️ Tue ${state.weatherResponse.current?.condition?.text ?? ''} '
                                  '${state.weatherResponse.forecast?.forecastday?[2].day?.minTempC ?? ''}° / ${state.weatherResponse.forecast?.forecastday?[2].day?.maxTempC ?? ''}°',
                                  style: AppTextStyles.forecastDetails,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Gap(10),
                    ],
                  ),
                )
              : Center(child: Text('No data available')),
        );
      },
    );
  }
}
