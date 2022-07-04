import 'city_screen.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/weather.dart';
import 'city_screen.dart';
class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeather});
  final locationWeather;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {

  WeatherModel weather = WeatherModel();
  String nameofCity;
  String weathersIcon;
  String weathersMessage;
  int temperature;


  @override
  void initState(){
    super.initState();
    updateUI(widget.locationWeather);

  }
  void updateUI(dynamic weatherdata){
    setState((){ if (weatherdata == null){
      temperature = 0;
      weathersIcon = 'Error!';
      weathersMessage = 'Unable to get weather data!';
      nameofCity = ' ';
      return;

    }
    double temp = weatherdata['main']['temp'];
    temperature = temp.toInt();
    var weathers = weatherdata['weather'][0]['id'];
    weathersIcon = weather.getWeatherIcon(weathers);
    weathersMessage = weather.getMessage(temperature);
    nameofCity = weatherdata['name'];
    });


  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/M.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () {
                      var weatherdata = weather.getLocationWeather();
                      updateUI(weatherdata);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      var typedName = await Navigator.push(context, MaterialPageRoute(builder: (context){
                      return CityScreen();
                      },),);
                      if (typedName != null){
                        var weatherdata = await weather.getCityWeather(typedName);
                        updateUI(weatherdata);

                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),

              Padding(
                padding: EdgeInsets.only(left: 40.0,bottom:300.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '$temperature°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      weathersIcon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 20,bottom: 50.0),
                child: Text(
                  '$weathersMessage in $nameofCity',
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
