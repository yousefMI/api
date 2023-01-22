import 'package:api/screen/weather/components/itemWeather.dart';
import 'package:api/screen/weather/components/model.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return StreamBuilder<ConnectivityResult>(
        stream: Connectivity().onConnectivityChanged,
        builder: (context, x) {
          return Scaffold(
            appBar: AppBar(
                title: const Text("Weather"),
                centerTitle: true,
                elevation: 0,
                backgroundColor: Colors.transparent),
            body: FutureBuilder(
                future: Dio().get(
                    "https://api.openweathermap.org/data/2.5/weather?q=mansoura&appid=509dc5d730ff2dd6003b22f30ae93313&fbclid=IwAR1OeQLoykiSqW_9w6mi2BqcUbCFl0Ikg_ZEYWdWTHhfFV5EBFpMHN2Y2IY"
                   // "https://api.open-meteo.com/v1/forecast?latitude=52.52&longitude=13.41&hourly=temperature_2m"
                     ),
                    //"https://api.openweathermap.org/data/2.5/weather?q=mansoura&appid=509dc5d730ff2dd6003b22f30ae93313"),
                builder: (context, snapshot) {
                  if (x.data == ConnectivityResult.wifi ||
                      x.data == ConnectivityResult.mobile) {
                    if (snapshot.hasData) {
                      final model = WeatherData.fromJson(snapshot.data!.data);
                      return Center(
                        child: ItemWeather(
                          wind: model.wind.speed.toString(),
                          Weather: model.clouds.all.toString(),
                          name: model.name,
                          minTemp: model.main.tempMin.toString(),
                          maxTemp: model.main.tempMax.toString(),
                        ),
                      );
                    } else {
                      return Center(
                          child: CircularProgressIndicator(
                              color: Color(0xff434343)));
                    }
                  } else {
                    return Center(
                      child: Text("Sorry check your internet"),
                    );
                  }
                }),
          );
        });
  }
}
