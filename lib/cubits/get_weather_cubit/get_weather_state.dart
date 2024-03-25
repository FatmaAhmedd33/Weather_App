import 'package:weather_app/models/weather_model.dart';

class WeatherState {}
//CREATE PARENT CLASS TO GIVE THE CLASS OF CUBIT ACCESS FOR ALL STATES WII INHERTANCE FROM PARENT ,

class IntialWeatherState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  final WeatherModel weatherModel;

  WeatherLoadedState({required this.weatherModel});
}

class WeatherFailureState extends WeatherState {}
