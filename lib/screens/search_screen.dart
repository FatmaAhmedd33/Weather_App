import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_services.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Search City",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
            child: TextField(
          //to get the input and passs it to function from attribute value
          /*   onChanged: (value) {
            //in onchange every char write in textfield do Trigger on it
            // print(value); equal to log but log print the value by different color
            //but takecare about somethings to choose the log import by developer not my math
            log(value);
          },*/
          onSubmitted: (value) async {
            //like on change but the different this do trigger when only end orf your text and click on buttom right
            /*  weatherModel =
                await WeatherSerives(dio: Dio()).getWeather(cityName: value);*/ //do this becuase we dont need anymore bec. of cubit

            Navigator.pop(
                context); //to return me to home view or the page before
          },
          decoration: const InputDecoration(
            hintText: 'Enter city name',
            suffixIcon: Icon(Icons.search),
            labelText: 'search',
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
            border: OutlineInputBorder(
                borderSide: BorderSide() //make aborder to the text field
                ),
          ),
        )),
      ),
    );
  }
}

//WeatherModel? weatherModel;comment bec.we dont need it bec of cubit
//create a global variable to can access in every file in this project
