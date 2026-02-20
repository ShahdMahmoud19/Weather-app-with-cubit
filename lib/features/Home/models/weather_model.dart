import 'package:weather_app_cubit/features/Home/models/current_model.dart';
import 'package:weather_app_cubit/features/Home/models/forecast_model.dart';
import 'package:weather_app_cubit/features/Home/models/location_model.dart';

class WeatherResponse {
  Location? location;
  Current? current;
  Forecast? forecast;

  WeatherResponse({this.location, this.current, this.forecast});

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    return WeatherResponse(
      location:
          json['location'] != null ? Location.fromJson(json['location']) : null,
      current:
          json['current'] != null ? Current.fromJson(json['current']) : null,
      forecast:
          json['forecast'] != null ? Forecast.fromJson(json['forecast']) : null,
    );
  }
}
