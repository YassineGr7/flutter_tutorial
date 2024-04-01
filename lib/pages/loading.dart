// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import "package:world_time/services/world_time.dart";
import "package:flutter_spinkit/flutter_spinkit.dart";

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time = "loading" ;

  void setupWorldTime() async {
    WorldTime obj1 = WorldTime(location: 'Berlin', flag: "germany.png", url: 'Europe/Berlin');
    await obj1.getData();
    Navigator.pushReplacementNamed(context, "/home", arguments: {
      "location" : obj1.location,
      "flag" : obj1.flag,
      "time" : obj1.time,
      "isDay" : obj1.isDay
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[300],
      body: Center(
         child: SpinKitFoldingCube(
              color: Colors.white,
              size: 50.0,
         ),
      ),
    );
  }
}
