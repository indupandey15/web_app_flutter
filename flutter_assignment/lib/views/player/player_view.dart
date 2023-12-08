import 'dart:ffi';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PlayerView extends StatefulWidget {
  const PlayerView({super.key});

  @override
  State<PlayerView> createState() => _PlayerViewState();
}

class _PlayerViewState extends State<PlayerView> {
  final String apiKey = 'YOUR_API_KEY'; // Replace with your OpenWeatherMap API key
  final String city = 'Barrie'; // Replace with the city name

  String weatherDescription = '';
  dynamic temperature = '0.0';

  @override
  void initState() {
    super.initState();
    fetchWeatherData();
  }

  Future<void> fetchWeatherData() async {
    final response = await http.get(Uri.parse("https://api.open-meteo.com/v1/forecast?latitude=44.4001&longitude=-79.6663&hourly=temperature_2m&daily=temperature_2m_max,temperature_2m_min&timezone=auto&forecast_days=1"),);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      setState(() {
        weatherDescription = "${data['latitude']} / ${data['longitude']}";
        temperature = data['daily']['temperature_2m_min']; // Convert to Celsius
      });
    } else {
      // Handle error
      print('Error fetching weather data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather API'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.map,
              color: Colors.deepPurpleAccent,
              size: 100,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'City: $city',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Text(
              'Temperature: ${temperature}°C',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Text(
              'Description: $weatherDescription',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}