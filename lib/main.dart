import 'package:flutter/material.dart';
import 'package:weatherapp/routes/route.dart';
import 'package:weatherapp/screens/home.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: Routes.getRoutes(),
      initialRoute: '/',
      theme: ThemeData(
          primaryColor: Colors.white,
          inputDecorationTheme: const InputDecorationTheme(
            labelStyle: TextStyle(color: Colors.amberAccent),
            hintStyle: TextStyle(color: Colors.amber),
          )),
      
     //home: Homescreen(),
    );
  }
}

