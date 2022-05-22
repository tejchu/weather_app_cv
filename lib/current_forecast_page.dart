import 'package:challenge/detailed_forecast_page.dart';
import 'package:challenge/navbar/nav_drawer.dart';
import 'package:flutter/material.dart';
import 'current_forecast_card.dart';
import 'main.dart';
import 'navbar/nav_bar.dart';

class CurrentForecastPage extends StatefulWidget {
  const CurrentForecastPage({Key? key}) : super(key: key);

  @override
  _CurrentForecastPageState createState() => _CurrentForecastPageState();
}

class _CurrentForecastPageState extends State<CurrentForecastPage> {
  List<City> cities = [
    City(cityName: 'Bremen', lat: 51, lon: 8),
    City(cityName: 'Berlin', lat: 59, lon: 10),
    City(cityName: 'Stuttgart', lat: 48, lon: 9),
    City(cityName: 'Munich', lat: 48, lon: 11),
    City(cityName: 'Hamburg', lat: 53, lon: 10),
    City(cityName: 'Frankfurt', lat: 50, lon: 8),
    City(cityName: 'Dortmund', lat: 51, lon: 7),
    City(cityName: 'Cologne', lat: 50, lon: 6),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      body: Container(
        child: Column(
          children: [
            NavBar(),
            SizedBox(height: 50),
            Expanded(
              child: ListView.builder(
                  itemCount: cities.length,
                  itemBuilder: (context, index) {
                    var selectedCity = cities[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) =>
                                  ForecastDetail(city: selectedCity)),
                        );
                      },
                      child: CurrentForecast(city: selectedCity));
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
