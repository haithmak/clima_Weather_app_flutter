import 'package:clima_flutter2/utilities/constants.dart';
import 'package:clima_flutter2/services/location.dart';
import 'package:clima_flutter2/services/networking.dart';

class WeatherModel {

  Future<dynamic> getCityWeather(String city) async {
    var url = Uri.parse('${urlMain}q=${city}&appid=${kAppid}&units=metric');
    NetworkHelper networkHelper = NetworkHelper(url) ;
    var weatherData = await networkHelper.getData() ;
    return weatherData ;

  }

  Future<dynamic> getLocationData() async {
    Location location = Location();
    await location.getLocation() ;
    var url = Uri.parse('${urlMain}lat=${location.latitude}&lon=${location.longitude}&appid=${kAppid}&units=metric');
    NetworkHelper networkHelper = NetworkHelper(url) ;

    var weatherData = await networkHelper.getData() ;

    return weatherData ;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
