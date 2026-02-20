import 'package:weather_app_cubit/features/Home/models/condition_model.dart';

class Day {
  double? maxTempC;
  double? minTempC;
  Condition? condition;

  Day({this.maxTempC, this.minTempC, this.condition});

  factory Day.fromJson(Map<String, dynamic> json) {
    return Day(
      maxTempC: json['maxtemp_c']?.toDouble(),
      minTempC: json['mintemp_c']?.toDouble(),
      condition: json['condition'] != null
          ? Condition.fromJson(json['condition'])
          : null,
    );
  }
}
class Hour {
  String? time;
  double? tempC;
  Condition? condition;

  Hour({this.time, this.tempC, this.condition});

  factory Hour.fromJson(Map<String, dynamic> json) {
    return Hour(
      time: json['time'],
      tempC: json['temp_c']?.toDouble(),
      condition: json['condition'] != null
          ? Condition.fromJson(json['condition'])
          : null,
    );
  }
}
