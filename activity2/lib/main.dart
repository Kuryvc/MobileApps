import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      home: hourlyForecast(),
    );
  }
}

class hourlyForecast extends StatelessWidget {
  const hourlyForecast({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.infinity,
      color: Color.fromARGB(255, 4, 43, 80),
      child: Column(children: [
        SizedBox(
          height: 35.0,
        ),
        Row(
          children: [
            SizedBox(
              width: 15.0,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Hourly Forecast",
                style: TextStyle(
                    fontSize: 15.0,
                    color: const Color.fromARGB(255, 127, 221, 234)),
              ),
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.all(12.0),
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Color.fromARGB(255, 10, 10, 46)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "16°",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w400,
                        letterSpacing: -.5),
                  ),
                  Text(
                    "14°",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w400,
                        letterSpacing: -.5),
                  ),
                  Text(
                    "14°",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w400,
                        letterSpacing: -.5),
                  ),
                  Text(
                    "13°",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w400,
                        letterSpacing: -.5),
                  ),
                  Text(
                    "11°",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w400,
                        letterSpacing: -.5),
                  )
                ],
              ),
              SizedBox(
                height: 25.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Icon(
                        Icons.nightlight,
                        color: Color.fromARGB(230, 17, 169, 189),
                      ),
                      SizedBox(
                        height: 6.0,
                      ),
                      Text(
                        "Now",
                        style: TextStyle(
                            color: Color.fromARGB(230, 174, 228, 235),
                            fontSize: 12.0,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.nightlight,
                        color: Color.fromARGB(230, 17, 169, 189),
                      ),
                      SizedBox(
                        height: 6.0,
                      ),
                      Text(
                        "12 AM",
                        style: TextStyle(
                            color: Color.fromARGB(230, 174, 228, 235),
                            fontSize: 12.0,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.nightlight,
                        color: Color.fromARGB(230, 17, 169, 189),
                      ),
                      SizedBox(
                        height: 6.0,
                      ),
                      Text(
                        "1 AM",
                        style: TextStyle(
                            color: Color.fromARGB(230, 174, 228, 235),
                            fontSize: 12.0,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.nightlight,
                        color: Color.fromARGB(230, 17, 169, 189),
                      ),
                      SizedBox(
                        height: 6.0,
                      ),
                      Text(
                        "2 AM",
                        style: TextStyle(
                            color: Color.fromARGB(230, 174, 228, 235),
                            fontSize: 12.0,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.nightlight,
                        color: Color.fromARGB(230, 17, 169, 189),
                      ),
                      SizedBox(
                        height: 6.0,
                      ),
                      Text(
                        "3 AM",
                        style: TextStyle(
                            color: Color.fromARGB(230, 174, 228, 235),
                            fontSize: 12.0,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 9.0,
        ),
        Row(
          children: [
            SizedBox(
              width: 15.0,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "10-Day Forecast",
                style: TextStyle(
                    fontSize: 15.0,
                    color: const Color.fromARGB(255, 127, 221, 234)),
              ),
            ),
          ],
        ),
        Expanded(child: WeatherList())
      ]),
    ));
  }
}

class WeatherList extends StatelessWidget {
  final List<String> days = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday"
  ];

  final List<String> weather = ["sunny", "cloud", "storm"];

  Icon getWeatherIcon(int weather) {
    switch (weather) {
      case 0:
        return Icon(
          Icons.cloud,
          color: Colors.white,
        );
      case 1:
        return Icon(Icons.sunny,
            color: const Color.fromARGB(255, 203, 186, 28));
      case 2:
        return Icon(Icons.storm,
            color: const Color.fromARGB(255, 25, 105, 171));
      // Add more cases for other weather conditions as needed
      default:
        return Icon(Icons
            .cloud); // Default icon if the weather condition is not matched
    }
  }

  void showWeatherSnackBar(
      BuildContext context, String day, String temperature) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$day          $temperature'),
        duration: Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (context, index) {
            return buildWeatherElement(context, index);
          }),
    );
  }

  Widget buildWeatherElement(BuildContext context, int index) {
    String day = index == 0 ? "Today" : days[index % 7];

    int temperatureMax = Random().nextInt(10) + 20;
    int temperatureMin = Random().nextInt(10) + 5;
    String temperatureHigh = "${temperatureMax.toString()}°";

    String temperatureLow = "/${temperatureMin.toString()}°";

    String temperature =
        "${temperatureMax.toString()}°/${temperatureMin.toString()}°";

    int weather = Random().nextInt(3);

    return Container(
      height: 49,
      margin: const EdgeInsets.only(right: 12.0, left: 12.0, bottom: 4.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: Color.fromARGB(255, 10, 10, 46)),
      child: ListTile(
        title: getWeatherIcon(weather),
        leading: Container(
          width: 120,
          child: Text(
            day,
            style: TextStyle(
                color: Colors.white,
                fontSize: 13.0,
                fontWeight: FontWeight.w300,
                letterSpacing: 0),
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              temperatureHigh,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 13.0,
                  fontWeight: FontWeight.w300,
                  letterSpacing: 0),
            ),
            Text(
              temperatureLow,
              style: TextStyle(
                  color: Color.fromARGB(255, 170, 217, 255),
                  fontSize: 13.0,
                  fontWeight: FontWeight.w300,
                  letterSpacing: 0),
            ),
          ],
        ),
        onTap: () {
          showWeatherSnackBar(context, day, temperature);
        },
      ),
    );
  }
}
