part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeSuccess extends HomeState {
  final WeatherResponse weatherResponse;
  final List<WeatherResponse> weatherList;
  final String? image;

  HomeSuccess({
    required this.weatherResponse,
    required this.weatherList,
    required this.image,
  });
}

final class HomeError extends HomeState {
  final String error;

  HomeError(String s, {required this.error});
}