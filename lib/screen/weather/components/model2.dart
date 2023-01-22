class WeatherData2 {

  late final int cod;
  late final String message;

  WeatherData2.fromJson(Map<String, dynamic> json){
    cod = json['cod'];
    message = json['message'];
  }

}