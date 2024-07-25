// import 'dart:convert';
// import 'package:dio/dio.dart';
// import 'dart:html';
// import 'package:flutter/material.dart';
// import 'package:weather_final_project/utility/MyStyle.dart';
// import 'package:intl/intl.dart';
// class weatherPage extends StatefulWidget {
//   const weatherPage ({super.key});
//   @override
//   State<weatherPage> createState() => _weatherPageState();
// }
// class _weatherPageState extends State<weatherPage> {
//   String _cityname = "Phuket";
//   String _weather ="";
//   double _lon = 0.0;
//   double _temp = 0.0;
//   double _low = 0.0;
//   double _high = 0.0;
//   double _pressure = 0.0;
//   double _humidity = 0.0;
//   double _wind = 0.0;
//   String _main = "";
//   int _timezone_offset = 0;
//   String _formattedDate = "";
//
//   Future<void> getWeatherDetails() async {
//
//     String _url = "https://api.openweathermap.org/data/2.5/weather?q=" + _cityname + "&appid=cbdd34fd64f851a3e69dd52a4c1d62cf";
//     try{
//       Response response = await Dio().get(_url);
//       Map<String, dynamic> result = json.decode(response.toString());
//       setState(() {
//         _lon = result['coord'] ['lon'];
//         _temp = result['main'] ['temp'] - 273.15;
//         _main = result['weather'][0]['main'];
//         _low = result['main'] ['temp_min'] - 273.15;
//         _high = result['main'] ['temp_max'] - 273.15;
//         _wind = result['wind'] ['speed'] * 3.6;
//         _pressure = result['main'] ['pressure'];
//         _humidity = result['main'] ['humidity'];
//         _timezone_offset = result ['timezone'];
//         DateTime currentTime = DateTime.now().toUtc().add(Duration(seconds: _timezone_offset));
//         _formattedDate = DateFormat('EEEE, d, yyyy').format(currentTime);
//       });
//       print(response.toString());
//
//     }catch(e){
//       print(e.toString());
//     }
//   }
//
//   @override
//   void initState(){
//     super.initState();
//     getWeatherDetails();
//   }
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text(
//           "Weather",
//           style: TextStyle(
//             fontSize: 25,
//             fontWeight: FontWeight.bold,
//             color:Colors.blue,
//           ),
//         ),
//         actions: [
//           PopupMenuButton(
//             onSelected: (item) {
//               setState(() {
//                 if (item == 0) {
//                   _cityname = "Pathumthani";
//
//                 } else if (item == 1) {
//                   _cityname = "Bangkok";
//                 }
//                 else if (item == 2) {
//                   _cityname = "Phuket";
//                 }
//                 else if (item == 3) {
//                   _cityname = "London";
//                 }
//                 else if (item == 4) {
//                   _cityname = "Taipei";
//                 }
//                 else if (item == 5) {
//                   _cityname = "Beijing";
//                 }
//                 getWeatherDetails();
//               });
//             },
//             itemBuilder: (context) => [
//               const PopupMenuItem(
//                 child: Text("Pathumthani"),
//                 value: 0,
//               ),
//               const PopupMenuItem(
//                 child: Text("Bangkok"),
//                 value: 1,
//               ),
//               const PopupMenuItem(
//                 child: Text("Phuket"),
//                 value: 2,
//               ),
//               const PopupMenuItem(
//                 child: Text("London"),
//                 value: 3,
//               ),
//               const PopupMenuItem(
//                 child: Text("Taipei"),
//                 value: 4,
//               ),
//               const PopupMenuItem(
//                 child: Text("Beijing"),
//                 value: 5,
//               ),
//             ],
//           ),
//         ],
//       ),
//       body: Center(
//         child: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//               colors: [
//                 Color.fromARGB(141, 225, 127, 160),
//                 Color.fromARGB(188, 115, 203, 235),
//               ],
//             ),
//           ),
//           padding: EdgeInsets.only(top:10),
//           child: Column(
//             //mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Align(
//                 alignment: Alignment.center,
//                 child: Container(
//                   child: Column(
//                     //crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         _cityname,
//                         style: TextStyle(
//                             fontSize: 30,
//                             fontWeight: FontWeight.bold),
//
//                       ),
//                       SizedBox(height: 5),
//                       Text(
//                         _formattedDate,
//                         style: TextStyle(fontSize: 20),
//                       ),
//                       MyStyle().mySpace(),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 width: 350,
//                 height: 150,
//                 child: Stack(
//                   fit: StackFit.expand,
//                   clipBehavior: Clip.none,
//                   children: <Widget>[
//                     Container(
//                       width: 350,
//                       height: 150,
//                       decoration: const BoxDecoration(
//                         color: Color.fromARGB(78, 78, 117, 215),
//                         borderRadius: BorderRadius.all(Radius.circular(20.0)),
//                       ),
//                     ),
//                     Positioned(
//                       top: -30,
//                       left: 10,
//                       /*child: Container(
//                         width: 80,
//                         height: 80,
//                         child: MyStyle().cloudy(),
//                       ), MMW hr */
//                       child: Container(
//                         child: MyStyle().GetImageForWeather(_main),
//                       ),
//                     ),
//                     Positioned(
//                       right: 15,
//                       top: 20,
//                       child: Text(
//                         _temp.toStringAsFixed(2) + " \u2103",
//                         style: TextStyle(fontSize: 30),
//                       ),
//                     ),
//                     Positioned(
//                       bottom: 10,
//                       left: 20,
//                       child: Text(
//                         _main,
//                         style: TextStyle(fontSize: 30),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Column(
//                     children: [
//                       MyStyle().mySpace(),
//                       MyStyle().showTextHeader("LOW"),
//                       MyStyle().mySpace(),
//                       MyStyle().low_temp(),
//                       MyStyle().mySpace(),
//                       Text(
//                         _low.toStringAsFixed(2) + " \u2103",
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 15,
//                         ),
//                       ),
//                     ],
//                   ),
//                   MyStyle().MySpace(),
//                   Column(
//                     children: [
//                       MyStyle().mySpace(),
//                       MyStyle().showTextHeader("HIGH"),
//                       MyStyle().mySpace(),
//                       MyStyle().high_temp(),
//                       MyStyle().mySpace(),
//                       Text(
//                         _high.toStringAsFixed(2) + " \u2103",
//                         style: TextStyle(
//                           fontSize: 15,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               MyStyle().mySpace(),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Column(
//                     children: [
//                       MyStyle().mySpace(),
//                       MyStyle().showTextHeader("WIND SPEED"),
//                       MyStyle().mySpace(),
//                       MyStyle().wind(),
//                       MyStyle().mySpace(),
//                       Text(
//                         _wind.toStringAsFixed(2) + " km/h",
//                         style: TextStyle(
//                           fontSize: 15,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                   MyStyle().MySpace(),
//                   Column(
//                     children: [
//                       MyStyle().mySpace(),
//                       MyStyle().showTextHeader("PRESSURE"),
//                       MyStyle().mySpace(),
//                       MyStyle().pressure(),
//                       MyStyle().mySpace(),
//                       Text(
//                         _pressure.toString(),
//                         style: TextStyle(
//                           fontSize: 15,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                   MyStyle().MySpace(),
//                   Column(
//                     children: [
//                       MyStyle().mySpace(),
//                       MyStyle().showTextHeader("HUMIDITY"),
//                       MyStyle().mySpace(),
//                       MyStyle().humidity(),
//                       MyStyle().mySpace(),
//                       Text(
//                         _humidity.toStringAsFixed(2) + " \u0025",
//                         style: TextStyle(
//                           fontSize: 15,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_final_project/utility/MyStyle.dart';
import 'package:intl/intl.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  String _cityname = "Phuket";
  String _weather = "";
  double _lon = 0.0;
  double _temp = 0.0;
  double _low = 0.0;
  double _high = 0.0;
  double _pressure = 0.0;
  double _humidity = 0.0;
  double _wind = 0.0;
  String _main = "";
  int _timezone_offset = 0;
  String _formattedDate = "";

  Future<void> getWeatherDetails() async {
    String _url =
        "https://api.openweathermap.org/data/2.5/weather?q=" + _cityname + "&appid=cbdd34fd64f851a3e69dd52a4c1d62cf";
    try {
      Response response = await Dio().get(_url);
      Map<String, dynamic> result = json.decode(response.toString());
      setState(() {
        _lon = result['coord']['lon'];
        _temp = result['main']['temp'] - 273.15;
        _main = result['weather'][0]['main'];
        _low = result['main']['temp_min'] - 273.15;
        _high = result['main']['temp_max'] - 273.15;
        _wind = result['wind']['speed'] * 3.6;
        _pressure = result['main']['pressure'];
        _humidity = result['main']['humidity'];
        _timezone_offset = result['timezone'];
        DateTime currentTime = DateTime.now().toUtc().add(Duration(seconds: _timezone_offset));
        _formattedDate = DateFormat('EEEE, d, yyyy').format(currentTime);
      });
      print(response.toString());
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    getWeatherDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Weather",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        actions: [
          PopupMenuButton(
            onSelected: (item) {
              setState(() {
                if (item == 0) {
                  _cityname = "Pathumthani";
                } else if (item == 1) {
                  _cityname = "Bangkok";
                } else if (item == 2) {
                  _cityname = "Phuket";
                } else if (item == 3) {
                  _cityname = "London";
                } else if (item == 4) {
                  _cityname = "Taipei";
                } else if (item == 5) {
                  _cityname = "Beijing";
                }
                getWeatherDetails();
              });
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                child: Text("Pathumthani"),
                value: 0,
              ),
              const PopupMenuItem(
                child: Text("Bangkok"),
                value: 1,
              ),
              const PopupMenuItem(
                child: Text("Phuket"),
                value: 2,
              ),
              const PopupMenuItem(
                child: Text("London"),
                value: 3,
              ),
              const PopupMenuItem(
                child: Text("Taipei"),
                value: 4,
              ),
              const PopupMenuItem(
                child: Text("Beijing"),
                value: 5,
              ),
            ],
          ),
        ],
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(141, 225, 127, 160),
                Color.fromARGB(188, 115, 203, 235),
              ],
            ),
          ),
          padding: EdgeInsets.only(top: 10),
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  child: Column(
                    children: [
                      Text(
                        _cityname,
                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Text(
                        _formattedDate,
                        style: TextStyle(fontSize: 20),
                      ),
                      MyStyle().mySpace(),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 350,
                height: 150,
                child: Stack(
                  fit: StackFit.expand,
                  clipBehavior: Clip.none,
                  children: <Widget>[
                    Container(
                      width: 350,
                      height: 150,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(78, 78, 117, 215),
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                    ),
                    Positioned(
                      top: -30,
                      left: 10,
                      child: Container(
                        child: MyStyle().GetImageForWeather(_main),
                      ),
                    ),
                    Positioned(
                      right: 15,
                      top: 20,
                      child: Text(
                        _temp.toStringAsFixed(2) + " \u2103",
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 20,
                      child: Text(
                        _main,
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      MyStyle().mySpace(),
                      MyStyle().showTextHeader("LOW"),
                      MyStyle().mySpace(),
                      MyStyle().low_temp(),
                      MyStyle().mySpace(),
                      Text(
                        _low.toStringAsFixed(2) + " \u2103",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  MyStyle().MySpace(),
                  Column(
                    children: [
                      MyStyle().mySpace(),
                      MyStyle().showTextHeader("HIGH"),
                      MyStyle().mySpace(),
                      MyStyle().high_temp(),
                      MyStyle().mySpace(),
                      Text(
                        _high.toStringAsFixed(2) + " \u2103",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              MyStyle().mySpace(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      MyStyle().mySpace(),
                      MyStyle().showTextHeader("WIND SPEED"),
                      MyStyle().mySpace(),
                      MyStyle().wind(),
                      MyStyle().mySpace(),
                      Text(
                        _wind.toStringAsFixed(2) + " km/h",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  MyStyle().MySpace(),
                  Column(
                    children: [
                      MyStyle().mySpace(),
                      MyStyle().showTextHeader("PRESSURE"),
                      MyStyle().mySpace(),
                      MyStyle().pressure(),
                      MyStyle().mySpace(),
                      Text(
                        _pressure.toString(),
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  MyStyle().MySpace(),
                  Column(
                    children: [
                      MyStyle().mySpace(),
                      MyStyle().showTextHeader("HUMIDITY"),
                      MyStyle().mySpace(),
                      MyStyle().humidity(),
                      MyStyle().mySpace(),
                      Text(
                        _humidity.toStringAsFixed(2) + " \u0025",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
