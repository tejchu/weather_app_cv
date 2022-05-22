import 'package:challenge/current_forecast_page.dart';
import 'package:challenge/navbar/nav_bar.dart';
import 'package:challenge/navbar/nav_drawer.dart';
import 'package:challenge/resume_page.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavigationDrawer(),
        body: Column(children: [
          NavBar(),
          SizedBox(height: 150),
          Container(
              child: Column(
            children: [
              Container(
                height: 100,
                width: 250,
                decoration: BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(color: Colors.black12, blurRadius: 16),
                  ],
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CurrentForecastPage(),
                    ));
                  },
                  child: Center(
                    child: Text('Weather Forecast',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white70,
                            fontSize: 23,
                            fontWeight: FontWeight.w300)),
                  ),
                ),
              ),
              SizedBox(height: 50),
              Container(
                height: 100,
                width: 250,
                decoration: BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(color: Colors.black12, blurRadius: 16),
                  ],
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ResumePage(),
                    ));
                  },
                  child: Center(
                    child: Text('My resume',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white70,
                            fontSize: 23,
                            fontWeight: FontWeight.w300)),
                  ),
                ),
              ),
            ],
          ))
        ]));
  }
}
