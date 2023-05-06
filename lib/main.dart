
import 'package:flutter/material.dart';
import 'package:whethero/screens/HomeScreen.dart';
import 'package:whethero/screens/LoadingScreen.dart';
import 'package:whethero/utils/Routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Whether app',
      theme: ThemeData.light(useMaterial3: true),
      home: LoadingScreen(),
      routes:{ Routes.lodingRoute:(context) => LoadingScreen(),
        Routes.HomeScreenRoute:(context) => HomeScreen(),
      }

    );
  }
}

