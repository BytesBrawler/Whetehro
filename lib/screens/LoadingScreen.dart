import 'dart:async';

import 'package:flutter/material.dart';
import 'package:whethero/utils/Routes.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {


  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {  Navigator.pushReplacementNamed(context, Routes.HomeScreenRoute);});

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          Padding(
            padding: const EdgeInsets.all(80.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,

              children: [
                Image.asset('assets/images/whetherlogo.png',height: 200,width: 200,),
                const Text("Whethero",style: TextStyle(fontSize: 40,fontWeight: FontWeight.w800,color: Colors.blue),)
                ,const Text("By imran"),
              ],
            ),
          ),


    );
  }


}
