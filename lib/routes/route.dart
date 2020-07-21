import 'package:flutter/material.dart';
import 'package:weatherapp/screens/home.dart';
import 'package:weatherapp/screens/splash.dart';

class Routes {
  static final _appRoutes = {
    '/': (BuildContext context) => SplashScreen(),
    '/home': (BuildContext context) => Homescreen(),
  };

  static getRoutes() {
    return _appRoutes;
  }
}