import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherSerives {
  final Dio dio;
  final String urlBase = 'http://api.weatherapi.com/v1';
  //we refactor code by this way because sometimes the domain or the path of methods can be change ,
  //in big projects you will make alot of methods with this response if change anything if the urlbase will take effor and long time to chnage it and its wrong .
  final String apiKey = '82edd9dee7304a78aab174320241403';
  //same thing to apiKey the apikey can has expire date
  WeatherSerives({required this.dio});
  Future<WeatherModel?> getWeather({required String cityName}) async {
    try {
      //we do ? to the return datatype to tell it it can return null
      Response response = await dio.get(
          '$urlBase/forecast.json?key=$apiKey&q=$cityName&days=1&aqi=no&alerts=no');

      WeatherModel weatherModel = response.data;
      return weatherModel;
    } catch (e) {
      return null;
      //not the best solution but now this is the solution if the request not correct for any reason
    }
  }
}
