import 'dart:convert';

import 'package:http/http.dart';

class ApiWorker{
  String temp = " ";
  String humidity = " ";
  String airSpeed = " ";
  String desc = " ";
  String main = " ";
  String location= "";
  String icon = "";


  ApiWorker(this.location){
    location=this.location;
  }

  Future<void> getdata() async {
    try {
      Response response =
      await get(Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?q=$location&APPID=793839706c6ecf2dea7d1cefec4e103a"));
      Map data = jsonDecode(response.body);


      //getting humidity & temp & pressure
      Map mainData = data["main"];
      double dTemp = (mainData["temp"]-273);
      temp = dTemp.toStringAsFixed(2); // '2.35'
   //   double inDouble = double.parse(inString)
    //  temp = dTemp.toString();
      humidity = mainData["humidity"].toString();


      //getting air speed
      Map air = data["wind"];
      airSpeed = air["speed"].toString();

      //getting desc and main
      List lmain = data["weather"];
      Map mMain = lmain[0];

      main = mMain["main"];
      desc = mMain["description"];
      icon = mMain["icon"];
      print(icon);
    }catch(e){
      print(e);
    }


  }
}