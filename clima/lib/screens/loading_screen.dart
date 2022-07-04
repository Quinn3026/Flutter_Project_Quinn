import 'package:geolocator/geolocator.dart';
import 'package:geolocator_web/geolocator_web.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:clima/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';



class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    // initstate can only call once when the state created.
    super.initState();
    getLocationData();
    //print('this line of code is triggered');
  }

  void getLocationData() async {

    WeatherModel weatherModel = WeatherModel();
    var weatherdata = await weatherModel.getLocationWeather();

    Navigator.push(context,
      MaterialPageRoute(builder: (context) {
        return LocationScreen(
          locationWeather: weatherdata,
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitWave(
          color: Colors.white,
          size: 90.0,
        ),
      ),
    );
  }
}
