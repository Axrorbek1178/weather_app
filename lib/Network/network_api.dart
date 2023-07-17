import 'package:weather_app/model/Weather.dart';
import 'package:dio/dio.dart';

class NetworkApi {
  Future<Weather?> getWeather(String value) async {
    Dio dio = Dio();
    var response = await dio.get(
        "https://api.weatherapi.com/v1/forecast.json?key=acb4a4de25aa41b784651422200510&q=Fergana&days=3&aqi=no&alerts=no");

    if (response.statusCode == 200) {
      return Weather.fromJson(response.data);
    }
  }

  Future searchFood(String txt) async {
    var dio;
    var response = await dio.get(
        "https://api.weatherapi.com/v1/forecast.json?key=acb4a4de25aa41b784651422200510&q=$txt&days=3&aqi=no&alerts=no");
    return Weather.fromJson(response.data);
  }
}
