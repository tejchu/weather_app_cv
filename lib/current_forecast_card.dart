import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'main.dart';

class CurrentForecast extends StatefulWidget {
  final City city;

  const CurrentForecast({Key? key, required this.city}) : super(key: key);

  @override
  _CurrentForecastState createState() => _CurrentForecastState();
}

class _CurrentForecastState extends State<CurrentForecast> {
  Map? responseMap;
  late List forecast;
  late String cityName;
  int? time;
  late String condition;
  late int temp;
  late var color;

  @override
  void initState() {
    super.initState();
    forecast = [];
    time = 0;
    temp =0;
    condition = '';
    cityName = widget.city.cityName;
    color = Colors.black12;
    fetchForecast(widget.city.lat, widget.city.lon);
  }

  Future<void> fetchForecast(double lat, double lon) async {
    var url = Uri.parse(
        'https://www.7timer.info/bin/astro.php?lon=$lon&lat=$lat&ac=0&unit=metric&output=json&tzshift=0');
    http.Response response = await http.get(url);
    responseMap = jsonDecode(response.body);
    setState(() {
      if(!mounted)return;
      forecast = responseMap!['dataseries'];
      time = forecast[0]["timepoint"];
      condition = forecast[0]['prec_type'];
      if (condition == 'none') {
        condition = 'dry';
      }
      temp = forecast[0]['temp2m'];
      if (temp < 15) {
        color = Colors.blueGrey;
      }else{
        color= Color.fromARGB(50, 200, 150, 20);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.only(left: 30, right: 30, bottom: 20),
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Container(
            height: 200,
            child: Center(
              child: Text('$cityName\nCurrent temperature: $temp C',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
            )));
  }
}
