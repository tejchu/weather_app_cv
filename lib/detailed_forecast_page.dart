import 'dart:convert';
import 'package:challenge/navbar/nav_bar.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'main.dart';
import 'navbar/nav_drawer.dart';
import 'package:intl/intl.dart';

class ForecastDetail extends StatefulWidget {
  final City city;

  const ForecastDetail({Key? key, required this.city}) : super(key: key);

  @override
  _ForecastDetailState createState() => _ForecastDetailState();
}

class _ForecastDetailState extends State<ForecastDetail> {
  Map? responseMap;
  late List forecast;
  late var temperature;
  late var condition;
  late var color;
  var image = '';
  var nightstart = DateTime(2022, 05, 1, 21);

  @override
  void initState() {
    super.initState();
    forecast = [];
    fetchForecastDetail(widget.city.lat, widget.city.lon);
  }

  Future<void> fetchForecastDetail(double lat, double lon) async {
    var url = Uri.parse(
        'https://www.7timer.info/bin/astro.php?lon=1$lon&lat=$lat&ac=0&unit=metric&output=json&tzshift=0');
    http.Response response = await http.get(url);
    responseMap = jsonDecode(response.body);

    setState(() {
      if(!mounted){return;};
      forecast = responseMap!['dataseries'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      body: Column(
        children: [
          NavBar(),
          SizedBox(
            height: 120,
            width: 300,
            child: Center(
              child: Text(
                  'Showing three-day forecast for:\n${widget.city.cityName}\n',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 30)),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: forecast.length,
              itemBuilder: (context, index) {
                var timenow = DateTime.now();
                timenow = timenow.add(new Duration(hours:3+index * 3));
                final String formattedTime = DateFormat.Hm().format(timenow);
                var ComparableTime = int.parse(DateFormat.H().format(timenow));
                final DateFormat formatter = DateFormat('dd.MM');
                final String formattedDate = formatter.format(timenow);
                temperature = forecast[index]['temp2m'].toString();
                condition = forecast[index]['prec_type'];
                if (condition == 'none') {
                  condition = 'dry';
                }
                if (condition == 'dry') {
                  if ((ComparableTime >= 20 && ComparableTime < 25) ||
                      (ComparableTime >= 0 && ComparableTime <= 6)) {
                    color = Colors.white;
                    image = 'assets/nightsky600x300.jpg';
                  } else {
                    color = Colors.black54;
                    image = 'sunny600x300.jpg';
                  }
                }
                if (condition == 'rain') {
                  color = Colors.white;
                  image = 'assets/rain.jpg';
                }
                return Card(
                  elevation: 5,
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Stack(children: [
                    Image.asset(
                      image,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Center(
                        child: Text(
                            '\n\n$formattedDate at $formattedTime\n\nCondition: $condition\nTemperature: $temperature C',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: color,
                                fontWeight: FontWeight.bold,
                                fontSize: 20)),
                      ),
                    ),
                  ]),
                  margin:
                      EdgeInsets.only(left: 45.0, right: 45.0, bottom: 30.0),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
