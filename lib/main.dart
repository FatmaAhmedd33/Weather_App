import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_wearther_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_state.dart';
import 'package:weather_app/screens/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetWeatherCubit(), //know i create the cubit that i will use to child of material app
      child: Builder(
        // builder attribute get call back method
        builder: (context) => BlocBuilder<GetWeatherCubit,WeatherState >(//make the material app wrap with blocbuilder bec. i want the themes rebuild after i get data
          builder: (context, state) {
            return MaterialApp(
              // here i have expection bec of context in bloc provider so i have to sol frist one extract material app or wrap material app with bulider widget
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                  primarySwatch: getWeatherColor(BlocProvider.of<
                          GetWeatherCubit>(context)
                      .weatherModel
                      ?.weatherCondition) //'?' tell it if weather model =null dont pass it to function
                  //Colors.amber //primarySwatch take material color like this value it consist of the degree of this color and use the defult color
                  ),
              home: const HomeView(),
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getWeatherColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition.toLowerCase()) {
    case 'sunny':
    case 'clear':
      return Colors.amber;
    case 'partly cloudy':
      return Colors.lightBlue;
    case 'cloudy':
    case 'overcast':
    case 'fog':
    case 'freezing fog':
      return Colors.grey;
    case 'mist':
    case 'patchy rain possible':
    case 'patchy snow possible':
    case 'patchy sleet possible':
    case 'patchy freezing drizzle possible':
      return Colors.lightBlue;
    case 'thundery outbreaks possible':
    case 'patchy light rain with thunder':
    case 'moderate or heavy rain with thunder':
    case 'patchy light snow with thunder':
    case 'moderate or heavy snow with thunder':
      return Colors.deepOrange;
    case 'blowing snow':
    case 'blizzard':
    case 'heavy snow':
      return Colors.cyan;
    case 'patchy light drizzle':
    case 'light drizzle':
    case 'freezing drizzle':
    case 'light freezing rain':
    case 'light sleet':
    case 'patchy light rain':
    case 'light rain':
    case 'light showers of ice pellets':
    case 'light rain shower':
      return Colors.lightBlue;
    case 'moderate rain at times':
    case 'moderate rain':
    case 'moderate or heavy freezing rain':
    case 'moderate or heavy sleet':
    case 'moderate or heavy rain shower':
    case 'torrential rain shower':
    case 'moderate or heavy sleet showers':
    case 'moderate or heavy snow showers':
    case 'moderate or heavy showers of ice pellets':
      return Colors.lightBlue;
    case 'patchy moderate snow':
    case 'moderate snow':
      return Colors.lightBlue;
    case 'patchy heavy snow':
    case 'ice pellets':
      return Colors.lightBlue;
    default:
      return Colors.blue;
  }
}
