double toDouble(dynamic jsonValue) {
  final type = jsonValue.runtimeType;
  switch (type.toString()) {
    case 'String' || 'double' || 'int':
      return jsonValue;
    default:
      return 0.0;
  }
}

class AirQuality {
  final double co;
  final double no2;
  final double o3;
  final int so2;
  final double pm2_5;
  final int pm10;
  final int usEpaIndex;
  final int gbDefraIndex;

  AirQuality({
    required this.co,
    required this.no2,
    required this.o3,
    required this.so2,
    required this.pm2_5,
    required this.pm10,
    required this.usEpaIndex,
    required this.gbDefraIndex,
  });

  factory AirQuality.fromJson(Map<String, dynamic> json) {
    return AirQuality(
      co: toDouble(json['co']),
      no2: toDouble(json['no2']),
      o3: toDouble(json['o3']),
      so2: json['so2'],
      pm2_5: toDouble(json['pm2_5']),
      pm10: json['pm10'],
      usEpaIndex: json['us-epa-index'],
      gbDefraIndex: json['gb-defra-index'],
    );
  }

  // Método utilitário para obter a descrição do índice de qualidade do ar (GB Defra)
  String get gbDefraIndexDescription {
    switch (gbDefraIndex) {
      case 1:
        return 'Low';
      case 2:
        return 'Low';
      case 3:
        return 'Moderate';
      case 4:
        return 'Moderate';
      case 5:
        return 'High';
      case 6:
        return 'High';
      case 7:
        return 'Very High';
      case 8:
        return 'Very High';
      case 9:
        return 'Very High';
      case 10:
        return 'Very High';
      default:
        return 'Unknown';
    }
  }

  // Método utilitário para obter a descrição do índice de qualidade do ar (US EPA)
  String get usEpaIndexDescription {
    switch (usEpaIndex) {
      case 1:
        return 'Good';
      case 2:
        return 'Moderate';
      case 3:
        return 'Unhealthy for Sensitive Groups';
      case 4:
        return 'Unhealthy';
      case 5:
        return 'Very Unhealthy';
      case 6:
        return 'Hazardous';
      default:
        return 'Unknown';
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'co': co,
      'no2': no2,
      'o3': o3,
      'so2': so2,
      'pm2_5': pm2_5,
      'pm10': pm10,
      'us-epa-index': usEpaIndex,
      'gb-defra-index': gbDefraIndex,
    };
  }
}

class Condition {
  final String text;
  final String icon;
  final int code;

  Condition({required this.text, required this.icon, required this.code});

  factory Condition.fromJson(Map<String, dynamic> json) {
    return Condition(
      text: json['text'],
      icon: json['icon'],
      code: json['code'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'text': text, 'icon': icon, 'code': code};
  }
}

class Current {
  final int lastUpdatedEpoch;
  final String lastUpdated;
  final double tempC;
  final double tempF;
  final int isDay;
  final Condition condition;
  final double windMph;
  final double windKph;
  final int windDegree;
  final String windDir;
  final double pressureMb;
  final double pressureIn;
  final double precipMm;
  final double precipIn;
  final int humidity;
  final int cloud;
  final double feelslikeC;
  final double feelslikeF;
  final double visKm;
  final double visMiles;
  final double uv;
  final double gustMph;
  final double gustKph;
  final AirQuality? airQuality; // Campo opcional

  Current({
    required this.lastUpdatedEpoch,
    required this.lastUpdated,
    required this.tempC,
    required this.tempF,
    required this.isDay,
    required this.condition,
    required this.windMph,
    required this.windKph,
    required this.windDegree,
    required this.windDir,
    required this.pressureMb,
    required this.pressureIn,
    required this.precipMm,
    required this.precipIn,
    required this.humidity,
    required this.cloud,
    required this.feelslikeC,
    required this.feelslikeF,
    required this.visKm,
    required this.visMiles,
    required this.uv,
    required this.gustMph,
    required this.gustKph,
    this.airQuality,
  });

  factory Current.fromJson(Map<String, dynamic> json) {
    return Current(
      lastUpdatedEpoch: json['last_updated_epoch'],
      lastUpdated: json['last_updated'],
      tempC: toDouble(json['temp_c']),
      tempF: toDouble(json['temp_f']),
      isDay: json['is_day'],
      condition: Condition.fromJson(json['condition']),
      windMph: toDouble(json['wind_mph']),
      windKph: toDouble(json['wind_kph']),
      windDegree: json['wind_degree'],
      windDir: json['wind_dir'],
      pressureMb: json['pressure_mb'],
      pressureIn: toDouble(json['pressure_in']),
      precipMm: json['precip_mm'],
      precipIn: json['precip_in'],
      humidity: json['humidity'],
      cloud: json['cloud'],
      feelslikeC: toDouble(json['feelslike_c']),
      feelslikeF: toDouble(json['feelslike_f']),
      visKm: json['vis_km'],
      visMiles: json['vis_miles'],
      uv: json['uv'],
      gustMph: toDouble(json['gust_mph']),
      gustKph: toDouble(json['gust_kph']),
      airQuality: json['air_quality'] != null
          ? AirQuality.fromJson(json['air_quality'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'last_updated_epoch': lastUpdatedEpoch,
      'last_updated': lastUpdated,
      'temp_c': tempC,
      'temp_f': tempF,
      'is_day': isDay,
      'condition': condition.toJson(),
      'wind_mph': windMph,
      'wind_kph': windKph,
      'wind_degree': windDegree,
      'wind_dir': windDir,
      'pressure_mb': pressureMb,
      'pressure_in': pressureIn,
      'precip_mm': precipMm,
      'precip_in': precipIn,
      'humidity': humidity,
      'cloud': cloud,
      'feelslike_c': feelslikeC,
      'feelslike_f': feelslikeF,
      'vis_km': visKm,
      'vis_miles': visMiles,
      'uv': uv,
      'gust_mph': gustMph,
      'gust_kph': gustKph,
      if (airQuality != null) 'air_quality': airQuality!.toJson(),
    };
  }
}

class CurrentResponse {
  final Location location;
  final Current current;

  CurrentResponse({required this.location, required this.current});

  factory CurrentResponse.fromJson(Map<String, dynamic> json) {
    return CurrentResponse(
      location: Location.fromJson(json['location']),
      current: Current.fromJson(json['current']),
    );
  }

  Map<String, dynamic> toJson() {
    return {'location': location.toJson(), 'current': current.toJson()};
  }
}

class Location {
  final String name;
  final String region;
  final String country;
  final double lat;
  final double lon;
  final String tzId;
  final int localtimeEpoch;
  final String localtime;

  Location({
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
    required this.tzId,
    required this.localtimeEpoch,
    required this.localtime,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      name: json['name'],
      region: json['region'],
      country: json['country'],
      lat: toDouble(json['lat']),
      lon: toDouble(json['lon']),
      tzId: json['tz_id'],
      localtimeEpoch: json['localtime_epoch'],
      localtime: json['localtime'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'region': region,
      'country': country,
      'lat': lat,
      'lon': lon,
      'tz_id': tzId,
      'localtime_epoch': localtimeEpoch,
      'localtime': localtime,
    };
  }
}
