import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/services/weather_api.dart';


class Homescreen extends StatefulWidget {
 
  @override
  State<StatefulWidget> createState() {
    return _HomescreenState();
  }
}

class _HomescreenState extends State<Homescreen> {
   TextEditingController cityController = TextEditingController();
   //String _cityName = 'Kolkata';
  bool _loading = true;
   void getWeather(String text) async {
      setState(() {
      _loading = true;
    });
    await weatherData.getWeather(city:text );
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getWeather('Kolkata');
    // _loading = true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [0.1, 0.5, 0.7, 0.9],
            colors: [
              Colors.yellow[200],
              Colors.amber[700],
              Colors.amber[600],
              Colors.amberAccent[400],
            ],
          ),
        ),
        child:Scaffold(
      backgroundColor: Colors.transparent,
       appBar: AppBar(
         backgroundColor: Colors.amber,
         title: Text('WeatherApp',style: TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                    fontSize: 29),),
         centerTitle: true,
         shape:  RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(30),
      ),
          ),
            

     ) ,
     body: SafeArea(
              child: _loading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Text(
                DateFormat('EEEE, d MMMM yyyy').format(DateTime.now()),
                style: TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
              ),
                        ),
                        //SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.only(left: 50),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(DateFormat.Hm().format(DateTime.parse( weatherData.weather.location.localtime)),
                                   
                                    style: TextStyle(
                                        color: Colors.blueGrey,
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    'pm',
                                    style: TextStyle(
                                        color: Colors.blueGrey,
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold),
                                  )
                                ]),
                          ),
                         
                         SizedBox(height:10),
                          Padding(
                            padding: const EdgeInsets.only(left:80,top:50,right:40),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(weatherData.weather.location.name,
                                  //cityController.text,
                                style: TextStyle(
                                            color: Colors.blueGrey,
                                            fontSize: 45,
                                            fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height:5),
                                Text(
                                          weatherData.weather.location.country
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.blueGrey,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  weatherData.weather.current.weatherIcons[0],
                                  height: 150,
                                  width: 170,
                                  fit: BoxFit.cover,
                                )),
                                 SizedBox(
                                          height: 10,
                                        ),
                                Text(
                                      '${weatherData.weather.current.temperature.round().toString()}°c',
                                      style: TextStyle(
                                          fontSize: 50,
                                          color: Colors.blueGrey,
                                          fontWeight: FontWeight.bold),
                                    ),
                                   
                                    Text(
                                        weatherData.weather.current.weatherDescriptions[0]
                                            ,
                                        style: TextStyle(
                                            fontSize: 30,
                                            color: Colors.blueGrey,
                                            fontWeight: FontWeight.bold),
                                      ),
                              ],
                            ),
                          ),
                          SizedBox(height:20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Text('${weatherData.weather.current.humidity.toString()}%',
                                  style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.blueGrey,
                                          fontWeight: FontWeight.bold),),
                                  Text('Humidity',style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.blueGrey,
                                          fontWeight: FontWeight.w500),)
                                ],
                              ),
                              Container(height:30,
                              width:2,color: Colors.blueGrey,),
                              Column(
                                children: [
                                  Text('${weatherData.weather.current.feelslike}°c',
                                  style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.blueGrey,
                                          fontWeight: FontWeight.bold),),
                                  Text('Feels Like',style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.blueGrey,
                                          fontWeight: FontWeight.w500),)
                                ],
                              ),
                               Container(height:30,
                              width:2,color: Colors.blueGrey,),
                              Column(
                                children: [
                                  Text('${weatherData.weather.current.pressure.toString()}mBar',
                                  style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.blueGrey,
                                          fontWeight: FontWeight.bold),),
                                  Text('Pressure',style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.blueGrey,
                                          fontWeight: FontWeight.w500),)
                                ],
                              ),
                              
                            ],
                          ),
                          
                             
                          Padding(
                            padding: const EdgeInsets.only(left:60,top:20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: 300,
                                  height: 50,
                                  padding: EdgeInsets.only(
                                      top: 4, left: 30, right: 16, bottom: 4),
                                  decoration: BoxDecoration(
                                      //border: Border.all(),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      color: Colors.grey[200],
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.orange, blurRadius: 5)
                                      ]),
                                  child: TextFormField(
                                    controller: cityController,
                                    decoration: InputDecoration(
                                      focusedBorder: InputBorder.none,
                                      hintText: 'Enter a City name',
                                      suffixIcon: IconButton(
                                      onPressed: () {
                                    getWeather(cityController.text);
                                      },
                                      icon: Icon(
                                        Icons.search,
                                        color: Colors.amber,
                                        size: 40,
                                      ),
                                    ),
                                    ),
                                  ),
                                ),
                                
                              ],
                            ),
                          ),
                              

                      ]))
     ));
  }
}
  
