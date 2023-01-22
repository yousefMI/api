class WeatherData1 {

  late final num latitude;
  late final num longitude;
  late final num generationtimeMs;
  late final num utcOffsetSeconds;
  late final String timezone;
  late final String timezoneAbbreviation;
  late final num elevation;
  late final HourlyUnits hourlyUnits;
  late final Hourly hourly;

  WeatherData1.fromJson(Map<String, dynamic> json){
    latitude = json['latitude'];
    longitude = json['longitude'];
    generationtimeMs = json['generationtime_ms'];
    utcOffsetSeconds = json['utc_offset_seconds'];
    timezone = json['timezone'];
    timezoneAbbreviation = json['timezone_abbreviation'];
    elevation = json['elevation'];
    hourlyUnits = HourlyUnits.fromJson(json['hourly_units']);
    hourly = Hourly.fromJson(json['hourly']);
  }

}

class HourlyUnits {

  late final String time;
  late final String temperature_2m;

  HourlyUnits.fromJson(Map<String, dynamic> json){
    time = json['time'];
    temperature_2m = json['temperature_2m'];
  }


}

class Hourly {

  late final List<String> time;
  late final List<num> temperature_2m;

  Hourly.fromJson(Map<String, dynamic> json){
    time = List.castFrom<dynamic, String>(json['time']);
    temperature_2m = List.castFrom<dynamic, num>(json['temperature_2m']);
  }

}