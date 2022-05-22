import 'package:challenge/landing_page.dart';
import 'package:flutter/material.dart';

//this app was made as a web app but it is
//compatible for mobile


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Case Study',
      debugShowCheckedModeBanner: false,
      home: LandingPage(),
    );
  }
}

//class for the cities offered in the forecast list
class City {
  final String cityName;
  final double lat;
  final double lon;

  City({
    required this.cityName,
    required this.lat,
    required this.lon,
  });
}
