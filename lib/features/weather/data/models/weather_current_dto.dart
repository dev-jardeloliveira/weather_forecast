import 'package:weather_forecast/core/services/models/current_response.dart';

class Condition {
  final String text;
  final String icon;
  final int code;

  Condition({required this.text, required this.icon, required this.code});

  factory Condition.fromJson(Map<String, dynamic> json) {
    String iconUrl = json['icon'];
    if (iconUrl.toString().isNotEmpty) {
      iconUrl = json['icon'].toString().replaceAll('//', 'http://');
    }
    return Condition(text: json['text'], icon: iconUrl, code: json['code']);
  }

  Map<String, dynamic> toJson() {
    return {'text': text, 'icon': icon, 'code': code};
  }
}

class Current {
  final String lastUpdated;
  final double tempC;
  final double tempF;
  final int isDay;
  final int humidity;
  final double feelslikeC;
  final double feelslikeF;
  final double uv;
  final Condition condition;

  Current({
    required this.lastUpdated,
    required this.tempC,
    required this.tempF,
    required this.isDay,
    required this.humidity,
    required this.feelslikeC,
    required this.feelslikeF,
    required this.uv,
    required this.condition,
  });

  factory Current.fromResponse(CurrentResponse response) {
    return Current(
      lastUpdated: response.current.lastUpdated,
      tempC: response.current.tempC,
      tempF: response.current.tempF,
      isDay: response.current.isDay,
      humidity: response.current.humidity,
      feelslikeC: response.current.feelslikeC,
      feelslikeF: response.current.feelslikeF,
      uv: response.current.uv,
      condition: Condition.fromJson(response.current.condition.toJson()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'last_updated': lastUpdated,
      'temp_c': tempC,
      'temp_f': tempF,
      'is_day': isDay,
      'humidity': humidity,
      'feelslike_c': feelslikeC,
      'feelslike_f': feelslikeF,
      'uv': uv,
      'condition': condition.toJson(),
    };
  }
}

class Location {
  final String name;
  final String region;
  final String country;
  final String localtime;

  Location({
    required this.name,
    required this.region,
    required this.country,
    required this.localtime,
  });

  factory Location.fromResponse(CurrentResponse response) {
    return Location(
      name: response.location.name,
      region: response.location.region,
      country: response.location.country,
      localtime: response.location.localtime,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'region': region,
      'country': country,
      'localtime': localtime,
    };
  }
}

class WeatherCurrentDto {
  final Location location;
  final Current current;

  WeatherCurrentDto({required this.current, required this.location});

  factory WeatherCurrentDto.fromResponse(CurrentResponse response) {
    return WeatherCurrentDto(
      current: Current.fromResponse(response),
      location: Location.fromResponse(response),
    );
  }

  Map<String, dynamic> toJson() {
    return {'current': current.toJson(), 'location': location.toJson()};
  }
}
