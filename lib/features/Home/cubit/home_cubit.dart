
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:dio/dio.dart';
import 'package:weather_app_cubit/features/Home/models/weather_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
    String baseUrl = 'https://api.weatherapi.com';
  String apiKey = 'd6d5e1aaf29e4b94b88150443252204';
  Dio dio = Dio();
        List<WeatherResponse> weatherList = [];

  Future<WeatherResponse> getData(String city) async {
    emit(HomeLoading());
    Response response = await dio.get(
      '$baseUrl/v1/forecast.json?key=$apiKey&q=$city&days=3&aqi=no&alerts=no',
    );
    try {
 
      String image = await getImage(city);
      WeatherResponse weatherResponse = WeatherResponse.fromJson(response.data);
      weatherList.add(weatherResponse);
      emit(HomeSuccess(weatherResponse: weatherResponse, weatherList: weatherList, image: image));
      return weatherResponse;
    } catch (e) {
      emit(HomeError('Failed to load data', error: e.toString()));
      throw Exception('Failed to load data');
    }
  }

  Future getImage(String cityImage) async {
    try {
      Response response = await dio.get(
        'https://api.pexels.com/v1/search?query=$cityImage',
        options: Options(
          headers: {
            'Authorization':
                '3gYqt7VZZmmQyu34DhGJkZHRqDTEEKfL8FK9BpAFYXqOPhT7kRNl9nss',
          },
        ),
      );
      return response.data['photos'][0]['src']['portrait'];
    } catch (e) {
      throw Exception('Failed to load image');
    }
  }

}
