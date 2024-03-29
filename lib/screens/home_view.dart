import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_wearther_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_state.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/screens/search_screen.dart';
import 'package:weather_app/widgets/no_weather_body.dart';
import 'package:weather_app/widgets/weather_info_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(
         
          //backgroundColor: Colors.blue,
           //backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text(
            'Weather App',
           //style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return const SearchScreen();
                    },
                  ),
                );
              },
              icon: const Icon(
                Icons.search,
               // color: Colors.white,
              ),
            ),
          ],
        ),
        body: BlocBuilder<GetWeatherCubit, WeatherState>(
          
          builder: (context, state) {
            if (state is IntialWeatherState) {
              return const NoWeatherBody();
            } else if (state is WeatherLoadedState) {
              return WeatherInfoBody(weather: state.weatherModel
                
               
              );
            } else {
              return const Text('oops, there was an error');
            }
          },
        ));
  }
}
/*
we notice when i use  this statment:
 body: weatherModel==null? const NoWeatherBody() :const WeatherInfoBody(),
will display the frist page even the weathermodel !=null
but will display the 2nd page when make a hot relaod
*/