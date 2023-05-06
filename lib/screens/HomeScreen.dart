import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_weather_icons/flutter_weather_icons.dart';

import '../utils/ApiWorker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String hTemp = " ";
  String hDesc = " ";
  String hSpeed = " ";
  String hMain = " ";
  String hHumadity = " ";
  String hIcon = " ";

  var Location = "Udaipur";
  var cityName = [
    "Mumbai",
    "Delhi",
    "Chennai",
    "Dhar",
    "Indore",
    "London",
    "Udaipur"
  ];
  final random = new Random();

  Future<void> StartApp() async {

    ApiWorker call = ApiWorker(Location);
    await call.getdata();
    hTemp = call.temp;
    hDesc = call.desc;
    hMain = call.main;
    hSpeed = call.airSpeed;
    hHumadity = call.humidity;
    hIcon = call.icon;

    setState(() {

    });
  }

  @override
  void initState() {
    super.initState();

      StartApp();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.blue, Colors.pinkAccent])),
          child: Column(
            children: [
              Row(
                children: [
                  Container(width: MediaQuery.of(context).size.width*0.85,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.white.withOpacity(0.5)),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 30),
                      padding: const EdgeInsets.all(26),
                      child: Row(children: [
                            Image.network("http://openweathermap.org/img/wn/$hIcon@2x.png"),
                        Column(
                          children: [
                            Text(
                              hDesc,
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "In $Location",
                              style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        )
                      ])),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.white.withOpacity(0.5)),
                      margin:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                      padding: EdgeInsets.all(26),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(WeatherIcons.wiThermometer),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  hTemp,
                                  style: const TextStyle(fontSize: 90),
                                ),
                                const Text(
                                  "C",
                                  style: TextStyle(fontSize: 30),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.white.withOpacity(0.5)),
                      margin: EdgeInsets.fromLTRB(20, 0, 10, 0),
                      padding: EdgeInsets.all(26),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [Icon(WeatherIcons.wiDayWindy)],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            hSpeed,
                            style: TextStyle(
                                fontSize: 40, fontWeight: FontWeight.bold),
                          ),
                          Text("km/hr")
                        ],
                      ),
                      height: 200,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.white.withOpacity(0.5)),
                      margin: EdgeInsets.fromLTRB(10, 0, 20, 0),
                      padding: EdgeInsets.all(26),
                      height: 200,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [Icon(WeatherIcons.wiHumidity)],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            hHumadity,
                            style: TextStyle(
                                fontSize: 40, fontWeight: FontWeight.bold),
                          ),
                          Text("Percent")
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Made By Imran"),
                    Text("Data Provided By Openweathermap.org")
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
