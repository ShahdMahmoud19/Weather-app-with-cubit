
import 'package:weather_app_cubit/features/Home/models/condition_model.dart';

class Current {
  double? tempC;
  int? humidity;
  double? windKph;
  Condition? condition;

  Current({
    this.tempC,
    this.humidity,
    this.windKph,
    this.condition,
  });

  factory Current.fromJson(Map<String, dynamic> json) {
    return Current(
      tempC: json['temp_c']?.toDouble(),
      humidity: json['humidity'],
      windKph: json['wind_kph']?.toDouble(),
      condition: json['condition'] != null
          ? Condition.fromJson(json['condition'])
          : null,
    );
  }
}
