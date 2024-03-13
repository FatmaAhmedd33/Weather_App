import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(backgroundColor: Colors.blue,
        title: const Text("Search City",style: TextStyle(color: Colors.white),),
      ) ,
      body: const Padding(
        padding:  EdgeInsets.all(8.0),
        child: Center(child:  TextField(
          decoration: InputDecoration(
            hintText: 'Enter city name',
            suffixIcon: Icon(Icons.search),
            labelText: 'search',
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
            border: OutlineInputBorder(borderSide: BorderSide()//make aborder to the text field
            ),
          ),
        )),
      ),
    );
  }
}