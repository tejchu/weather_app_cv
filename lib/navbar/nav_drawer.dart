import 'package:challenge/landing_page.dart';
import 'package:challenge/resume_page.dart';
import 'package:flutter/material.dart';

import '../current_forecast_page.dart';


class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.black54,),
        ],
      ),
      child: Column(
        children: <Widget>[
          Container(
            height: 60,
            width: 250,
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => LandingPage(),
                ));
              },
              child: (Icon(Icons.home, color: Colors.white38)),
              ),),
          SizedBox(
            height: 40,
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 40,
            margin: EdgeInsets.only(left: 0, right: 0),
            child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => CurrentForecastPage(),
                  ));
                },
                child: Text('Weather Forecast',
                    style: TextStyle(
                        color: Colors.white54,
                        fontWeight: FontWeight.bold,
                        fontSize: 20))),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 40,
            margin: EdgeInsets.only(left: 0, right: 0),
            child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ResumePage(),
                  ));
                },
                child: Text('My CV',
                    style: TextStyle(
                        color: Colors.white54,
                        fontWeight: FontWeight.bold,
                        fontSize: 20))),
          ),
          //DrawerItem('Settings', Icons.settings),
        ],
      ),
    );
  }
}
