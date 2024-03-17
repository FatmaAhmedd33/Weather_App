import 'dart:developer';

import 'package:flutter/material.dart';

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
          onSubmitted: (value) {
            //like on change but the different this do trigger when only end orf your text and click on buttom right
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
