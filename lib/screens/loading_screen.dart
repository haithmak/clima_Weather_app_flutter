import 'package:clima_flutter2/services/location.dart';
import 'package:clima_flutter2/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:clima_flutter2/utilities/constants.dart';
import 'package:clima_flutter2/screens/location_screen.dart';
import 'package:clima_flutter2/services/weather.dart';
class LoadingScreen extends StatefulWidget {

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  double ?  latitude ;
  double  ? longitude ;

  @override
  void initState() {
    super.initState();
    getLocationData() ;
  }

  void getLocationData() async {
    
    var weatherData = await WeatherModel().getLocationData() ;
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationScreen(weatherData);
    })) ;
    

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            getLocationData()  ;
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
