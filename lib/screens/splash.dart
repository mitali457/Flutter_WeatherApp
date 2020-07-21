
import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }
  startTime() async {
    var _duration = Duration(seconds: 4);
     Timer(_duration, 
     () => Navigator.of(context).pushReplacementNamed("/home")
            );
  }
  void navigationPage() async {
    print('Welcom to splash screen');
  }

 @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Center(
        
        child: Stack(
          children: [
             Container(
               
                decoration: BoxDecoration(
           
          
            
             
                
            image: DecorationImage(
              image: NetworkImage("https://pbs.twimg.com/profile_images/1417177165/12284285012032586819sivvus_weather_symbols_2_svg_hi.png"),
               fit: BoxFit.fill
               ),
          )),
          
          ]),
      ),
    );
  }
}