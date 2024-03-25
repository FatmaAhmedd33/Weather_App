import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_state.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_services.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(IntialWeatherState()); //the state of app when start
   WeatherModel ?weatherModel;
  getWeather({required String cityName}) async {
    try {
       weatherModel =
          await WeatherSerives(dio: Dio()).getWeather(cityName: cityName);
          
      emit(WeatherLoadedState(weatherModel: weatherModel!)); //emit this function that talk to ui
    } catch (e) {
      // appear any exception
      emit(WeatherFailureState());
    }
  }
}
