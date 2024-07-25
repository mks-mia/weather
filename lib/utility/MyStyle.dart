import 'package:flutter/material.dart';

class MyStyle {
  Container myLogo() {
    return Container(

      width: 100.0,
      child: Image.asset('images/rsu.png'),
    );
  }
  Container high_temp() {
    return Container(
      height: 50.0,

      width: 50.0,
      child: Image.asset('images/high_temp.png'),
    );
  }
  Container low_temp() {
    return Container(
      height: 50.0,

      width: 50.0,
      child: Image.asset('images/low_temp.png'),
    );
  }
  Container wind() {
    return Container(
      height: 50.0,

      width: 50.0,
      child: Image.asset('images/wind.png'),
    );
  }
  Container pressure() {
    return Container(
      height: 50.0,

      width: 50.0,
      child: Image.asset('images/pressure.png'),
    );
  }
  Container humidity() {
    return Container(
      height: 50.0,

      width: 50.0,
      child: Image.asset('images/humidity.png'),
    );
  }
  Container cloudy() {
    return Container(
      height: 50.0,

      width: 50.0,
      child: Image.asset('images/cloudy.png'),
    );
  }
  Container rain() {
    return Container(
      height: 50.0,

      width: 50.0,
      child: Image.asset('images/rain.png'),
    );
  }



  Text showTextTitle(String strTitle) =>
      Text(
        strTitle,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
          color: Colors.blue,
        ),
      );

  Text showTextHeader(String strHeader) {
    return Text(
      strHeader,
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }

  Text firstPage(String strHeader) {
    return Text(
      strHeader,
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: Colors.red,
      ),
    );
  }

  SizedBox mySpace() {
    return const SizedBox(
      height: 20,
    );

  }
  SizedBox MySpace() {
    return const SizedBox(
      width: 50,
    );

  }
  Container GetImageForWeather(String weatherType){
    if(weatherType == "Clouds"){
      return Container(
        height: 100.0,
        width: 100.0,
        child: Image.asset('images/cloudy.png'),
      );
    }
    else if (weatherType == "Rain"){
      return Container(
        height: 100.0,
        width: 100.0,
        child: Image.asset('images/rain.png'),
      );
    }
    else if(weatherType == "Clear"){
      return Container(
        height: 100.0,
        width: 100.0,
        child: Image.asset('images/sun.png'),
      );
    }
    else {
      return Container(
        height: 100.0,
        width: 100.0,
        child: Image.asset('images/smile.png'),
      );
    }
  }
}
