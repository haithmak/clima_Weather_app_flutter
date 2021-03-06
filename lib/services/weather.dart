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
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
