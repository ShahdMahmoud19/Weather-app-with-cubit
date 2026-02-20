import 'package:weather_app_cubit/features/Home/models/day_hour_model.dart';

class Forecast {
  List<ForecastDay>? forecastday;

  Forecast({this.forecastday});

  factory Forecast.fromJson(Map<String, dynamic> json) {
    return Forecast(
      forecastday: (json['forecastday'] as List?)
          ?.map((e) => ForecastDay.fromJson(e))
          .toList(),
    );
  }
}
class ForecastDay {
  String? date;
  Day? day;
  List<Hour>? hour;

  ForecastDay({this.date, this.day, this.hour});

  factory ForecastDay.fromJson(Map<String, dynamic> json) {
    return ForecastDay(
      date: json['date'],
      day: json['day'] != null ? Day.fromJson(json['day']) : null,
      hour:
          (json['hour'] as List?)?.map((e) => Hour.fromJson(e)).toList(),
    );
  }
}
