double toDouble(dynamic jsonValue) {
  final type = jsonValue.runtimeType;
  switch (type.toString()) {
    case 'String' || 'double' || 'int':
      return jsonValue;
    default:
      return 0.0;
  }
}

// ============= AIR QUALITY =============
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
      co: toDouble((json['co'] ?? 0.0)),
      no2: toDouble((json['no2'] ?? 0.0)),
      o3: toDouble((json['o3'] ?? 0.0)),
      so2: json['so2'] ?? 0,
      pm2_5: toDouble((json['pm2_5'] ?? 0.0)),
      pm10: json['pm10'] ?? 0,
      usEpaIndex: json['us-epa-index'] ?? 1,
      gbDefraIndex: json['gb-defra-index'] ?? 1,
    );
  }

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

// ============= ALERT =============
class Alert {
  final String headline;
  final String? msgtype;
  final String? severity;
  final String? urgency;
  final String? areas;
  final String category;
  final String? certainty;
  final String event;
  final String? note;
  final String effective;
  final String expires;
  final String desc;
  final String instruction;

  Alert({
    required this.headline,
    this.msgtype,
    this.severity,
    this.urgency,
    this.areas,
    required this.category,
    this.certainty,
    required this.event,
    this.note,
    required this.effective,
    required this.expires,
    required this.desc,
    required this.instruction,
  });

  factory Alert.fromJson(Map<String, dynamic> json) {
    return Alert(
      headline: json['headline'] ?? '',
      msgtype: json['msgtype'],
      severity: json['severity'],
      urgency: json['urgency'],
      areas: json['areas'],
      category: json['category'] ?? '',
      certainty: json['certainty'],
      event: json['event'] ?? '',
      note: json['note'],
      effective: json['effective'] ?? '',
      expires: json['expires'] ?? '',
      desc: json['desc'] ?? '',
      instruction: json['instruction'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'headline': headline,
      'msgtype': msgtype,
      'severity': severity,
      'urgency': urgency,
      'areas': areas,
      'category': category,
      'certainty': certainty,
      'event': event,
      'note': note,
      'effective': effective,
      'expires': expires,
      'desc': desc,
      'instruction': instruction,
    };
  }
}

// ============= ALERTS =============
class Alerts {
  final List<Alert> alert;

  Alerts({required this.alert});

  factory Alerts.fromJson(Map<String, dynamic> json) {
    return Alerts(
      alert:
          (json['alert'] as List?)
              ?.map((item) => Alert.fromJson(item))
              .toList() ??
          [],
    );
  }

  bool get hasAlerts => alert.isNotEmpty;

  Map<String, dynamic> toJson() {
    return {'alert': alert.map((item) => item.toJson()).toList()};
  }
}

// ============= ASTRO =============
class Astro {
  final String sunrise;
  final String sunset;
  final String moonrise;
  final String moonset;
  final String moonPhase;
  final int moonIllumination;

  Astro({
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    required this.moonPhase,
    required this.moonIllumination,
  });

  factory Astro.fromJson(Map<String, dynamic> json) {
    return Astro(
      sunrise: json['sunrise'] ?? '',
      sunset: json['sunset'] ?? '',
      moonrise: json['moonrise'] ?? '',
      moonset: json['moonset'] ?? '',
      moonPhase: json['moon_phase'] ?? '',
      moonIllumination: json['moon_illumination'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'sunrise': sunrise,
      'sunset': sunset,
      'moonrise': moonrise,
      'moonset': moonset,
      'moon_phase': moonPhase,
      'moon_illumination': moonIllumination,
    };
  }
}

// ============= CONDITION =============
class Condition {
  final String text;
  final String icon;
  final int code;

  Condition({required this.text, required this.icon, required this.code});

  factory Condition.fromJson(Map<String, dynamic> json) {
    return Condition(
      text: json['text'] ?? '',
      icon: json['icon'] ?? '',
      code: json['code'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {'text': text, 'icon': icon, 'code': code};
  }
}

// ============= CURRENT =============
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
  final AirQuality? airQuality;

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
      lastUpdatedEpoch: json['last_updated_epoch'] ?? 0,
      lastUpdated: json['last_updated'] ?? '',
      tempC: toDouble((json['temp_c'] ?? 0.0)),
      tempF: toDouble((json['temp_f'] ?? 0.0)),
      isDay: json['is_day'] ?? 0,
      condition: Condition.fromJson(json['condition'] ?? {}),
      windMph: toDouble((json['wind_mph'] ?? 0.0)),
      windKph: toDouble((json['wind_kph'] ?? 0.0)),
      windDegree: json['wind_degree'] ?? 0,
      windDir: json['wind_dir'] ?? '',
      pressureMb: json['pressure_mb'] ?? 0,
      pressureIn: toDouble((json['pressure_in'] ?? 0.0)),
      precipMm: json['precip_mm'] ?? 0,
      precipIn: json['precip_in'] ?? 0,
      humidity: json['humidity'] ?? 0,
      cloud: json['cloud'] ?? 0,
      feelslikeC: toDouble((json['feelslike_c'] ?? 0.0)),
      feelslikeF: toDouble((json['feelslike_f'] ?? 0.0)),
      visKm: json['vis_km'] ?? 0,
      visMiles: json['vis_miles'] ?? 0,
      uv: json['uv'] ?? 0,
      gustMph: toDouble((json['gust_mph'] ?? 0.0)),
      gustKph: toDouble((json['gust_kph'] ?? 0.0)),
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

// ============= DAY =============
class Day {
  final double maxtempC;
  final double maxtempF;
  final double mintempC;
  final double mintempF;
  final double avgtempC;
  final double avgtempF;
  final double maxwindMph;
  final double maxwindKph;
  final double totalprecipMm;
  final double totalprecipIn;
  final double avgvisKm;
  final double avgvisMiles;
  final int avghumidity;
  final int dailyWillItRain;
  final int dailyChanceOfRain;
  final int dailyWillItSnow;
  final int dailyChanceOfSnow;
  final Condition condition;
  final double uv;

  Day({
    required this.maxtempC,
    required this.maxtempF,
    required this.mintempC,
    required this.mintempF,
    required this.avgtempC,
    required this.avgtempF,
    required this.maxwindMph,
    required this.maxwindKph,
    required this.totalprecipMm,
    required this.totalprecipIn,
    required this.avgvisKm,
    required this.avgvisMiles,
    required this.avghumidity,
    required this.dailyWillItRain,
    required this.dailyChanceOfRain,
    required this.dailyWillItSnow,
    required this.dailyChanceOfSnow,
    required this.condition,
    required this.uv,
  });

  factory Day.fromJson(Map<String, dynamic> json) {
    return Day(
      maxtempC: toDouble((json['maxtemp_c'] ?? 0.0)),
      maxtempF: toDouble((json['maxtemp_f'] ?? 0.0)),
      mintempC: toDouble((json['mintemp_c'] ?? 0.0)),
      mintempF: toDouble((json['mintemp_f'] ?? 0.0)),
      avgtempC: toDouble((json['avgtemp_c'] ?? 0.0)),
      avgtempF: toDouble((json['avgtemp_f'] ?? 0.0)),
      maxwindMph: toDouble((json['maxwind_mph'] ?? 0.0)),
      maxwindKph: toDouble((json['maxwind_kph'] ?? 0.0)),
      totalprecipMm: json['totalprecip_mm'] ?? 0,
      totalprecipIn: json['totalprecip_in'] ?? 0,
      avgvisKm: json['avgvis_km'] ?? 0,
      avgvisMiles: json['avgvis_miles'] ?? 0,
      avghumidity: json['avghumidity'] ?? 0,
      dailyWillItRain: json['daily_will_it_rain'] ?? 0,
      dailyChanceOfRain: json['daily_chance_of_rain'] ?? 0,
      dailyWillItSnow: json['daily_will_it_snow'] ?? 0,
      dailyChanceOfSnow: json['daily_chance_of_snow'] ?? 0,
      condition: Condition.fromJson(json['condition'] ?? {}),
      uv: json['uv'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'maxtemp_c': maxtempC,
      'maxtemp_f': maxtempF,
      'mintemp_c': mintempC,
      'mintemp_f': mintempF,
      'avgtemp_c': avgtempC,
      'avgtemp_f': avgtempF,
      'maxwind_mph': maxwindMph,
      'maxwind_kph': maxwindKph,
      'totalprecip_mm': totalprecipMm,
      'totalprecip_in': totalprecipIn,
      'avgvis_km': avgvisKm,
      'avgvis_miles': avgvisMiles,
      'avghumidity': avghumidity,
      'daily_will_it_rain': dailyWillItRain,
      'daily_chance_of_rain': dailyChanceOfRain,
      'daily_will_it_snow': dailyWillItSnow,
      'daily_chance_of_snow': dailyChanceOfSnow,
      'condition': condition.toJson(),
      'uv': uv,
    };
  }
}

// ============= FORECAST =============
class Forecast {
  final List<ForecastDay> forecastday;

  Forecast({required this.forecastday});

  factory Forecast.fromJson(Map<String, dynamic> json) {
    return Forecast(
      forecastday:
          (json['forecastday'] as List?)
              ?.map((item) => ForecastDay.fromJson(item))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {'forecastday': forecastday.map((item) => item.toJson()).toList()};
  }
}

// ============= FORECAST DAY =============
class ForecastDay {
  final String date;
  final int dateEpoch;
  final Day day;
  final Astro astro;
  final List<Hour> hour;

  ForecastDay({
    required this.date,
    required this.dateEpoch,
    required this.day,
    required this.astro,
    required this.hour,
  });

  factory ForecastDay.fromJson(Map<String, dynamic> json) {
    return ForecastDay(
      date: json['date'] ?? '',
      dateEpoch: json['date_epoch'] ?? 0,
      day: Day.fromJson(json['day'] ?? {}),
      astro: Astro.fromJson(json['astro'] ?? {}),
      hour:
          (json['hour'] as List?)
              ?.map((item) => Hour.fromJson(item))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'date_epoch': dateEpoch,
      'day': day.toJson(),
      'astro': astro.toJson(),
      'hour': hour.map((item) => item.toJson()).toList(),
    };
  }
}

class ForecastResponse {
  final Location location;
  final Current current;
  final Forecast forecast;
  final Alerts? alerts;

  ForecastResponse({
    required this.location,
    required this.current,
    required this.forecast,
    required this.alerts,
  });

  factory ForecastResponse.fromJson(Map<String, dynamic> json) {
    return ForecastResponse(
      location: Location.fromJson(json['location']),
      current: Current.fromJson(json['current']),
      forecast: Forecast.fromJson(json['forecast']),
      alerts: json['alerts'] != null
          ? Alerts.fromJson(json['alerts'])
          : Alerts.fromJson({}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'location': location.toJson(),
      'current': current.toJson(),
      'forecast': forecast.toJson(),
      'alerts': alerts?.toJson(),
    };
  }
}

// ============= HOUR =============
class Hour {
  final int timeEpoch;
  final String time;
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
  final double windchillC;
  final double windchillF;
  final double heatindexC;
  final double heatindexF;
  final double dewpointC;
  final double dewpointF;
  final int willItRain;
  final int chanceOfRain;
  final int willItSnow;
  final int chanceOfSnow;
  final double visKm;
  final double visMiles;
  final double gustMph;
  final double gustKph;
  final double uv;

  Hour({
    required this.timeEpoch,
    required this.time,
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
    required this.windchillC,
    required this.windchillF,
    required this.heatindexC,
    required this.heatindexF,
    required this.dewpointC,
    required this.dewpointF,
    required this.willItRain,
    required this.chanceOfRain,
    required this.willItSnow,
    required this.chanceOfSnow,
    required this.visKm,
    required this.visMiles,
    required this.gustMph,
    required this.gustKph,
    required this.uv,
  });

  factory Hour.fromJson(Map<String, dynamic> json) {
    final uv = json['uv'];
    return Hour(
      timeEpoch: json['time_epoch'] ?? 0,
      time: json['time'] ?? '',
      tempC: toDouble((json['temp_c'] ?? 0.0)),
      tempF: toDouble((json['temp_f'] ?? 0.0)),
      isDay: json['is_day'] ?? 0,
      condition: Condition.fromJson(json['condition'] ?? {}),
      windMph: toDouble((json['wind_mph'] ?? 0.0)),
      windKph: toDouble((json['wind_kph'] ?? 0.0)),
      windDegree: json['wind_degree'] ?? 0,
      windDir: json['wind_dir'] ?? '',
      pressureMb: json['pressure_mb'] ?? 0,
      pressureIn: toDouble((json['pressure_in'] ?? 0.0)),
      precipMm: json['precip_mm'] ?? 0,
      precipIn: json['precip_in'] ?? 0,
      humidity: json['humidity'] ?? 0,
      cloud: json['cloud'] ?? 0,
      feelslikeC: toDouble((json['feelslike_c'] ?? 0.0)),
      feelslikeF: toDouble((json['feelslike_f'] ?? 0.0)),
      windchillC: toDouble((json['windchill_c'] ?? 0.0)),
      windchillF: toDouble((json['windchill_f'] ?? 0.0)),
      heatindexC: toDouble((json['heatindex_c'] ?? 0.0)),
      heatindexF: toDouble((json['heatindex_f'] ?? 0.0)),
      dewpointC: toDouble((json['dewpoint_c'] ?? 0.0)),
      dewpointF: toDouble((json['dewpoint_f'] ?? 0.0)),
      willItRain: json['will_it_rain'] ?? 0,
      chanceOfRain: json['chance_of_rain'] ?? 0,
      willItSnow: json['will_it_snow'] ?? 0,
      chanceOfSnow: json['chance_of_snow'] ?? 0,
      visKm: json['vis_km'] ?? 0,
      visMiles: json['vis_miles'] ?? 0,
      gustMph: toDouble((json['gust_mph'] ?? 0.0)),
      gustKph: toDouble((json['gust_kph'] ?? 0.0)),
      uv: uv.runtimeType == int ? (uv as int).toDouble() : uv,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'time_epoch': timeEpoch,
      'time': time,
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
      'windchill_c': windchillC,
      'windchill_f': windchillF,
      'heatindex_c': heatindexC,
      'heatindex_f': heatindexF,
      'dewpoint_c': dewpointC,
      'dewpoint_f': dewpointF,
      'will_it_rain': willItRain,
      'chance_of_rain': chanceOfRain,
      'will_it_snow': willItSnow,
      'chance_of_snow': chanceOfSnow,
      'vis_km': visKm,
      'vis_miles': visMiles,
      'gust_mph': gustMph,
      'gust_kph': gustKph,
      'uv': uv,
    };
  }
}

// ============= LOCATION =============
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
      name: json['name'] ?? '',
      region: json['region'] ?? '',
      country: json['country'] ?? '',
      lat: toDouble((json['lat'] ?? 0.0)),
      lon: toDouble((json['lon'] ?? 0.0)),
      tzId: json['tz_id'] ?? '',
      localtimeEpoch: json['localtime_epoch'] ?? 0,
      localtime: json['localtime'] ?? '',
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
