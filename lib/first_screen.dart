import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_final_project/utility/MyStyle.dart';
import 'package:weather_final_project/weather.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed( const Duration(seconds: 5),
          (){
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => WeatherPage(),
        ),
        );
      },
    );
  }
  @override
  void dispose(){
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
    super.dispose();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(141, 225, 127, 160),
              Color.fromARGB(188, 115, 203, 235),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyStyle().myLogo(),
              MyStyle().mySpace(),
              MyStyle().firstPage("Rangsit University"),
            ],
          ),
        ),
      ),
    );
  }
}