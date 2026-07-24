import 'package:weather_forecast/core/services/models/forecast_response.dart';

class Current {
  final String lastUpdated;
  final double tempC;
  final double tempF;
  final int isDay;
  final int humidity;
  final double feelslikeC;
  final double feelslikeF;
  final double uv;

  Current({
    required this.lastUpdated,
    required this.tempC,
    required this.tempF,
    required this.isDay,
    required this.humidity,
    required this.feelslikeC,
    required this.feelslikeF,
    required this.uv,
  });

  factory Current.fromResponse(ForecastResponse response) {
    return Current(
      lastUpdated: response.current.lastUpdated,
      tempC: response.current.tempC,
      tempF: response.current.tempF,
      isDay: response.current.isDay,
      humidity: response.current.humidity,
      feelslikeC: response.current.feelslikeC,
      feelslikeF: response.current.feelslikeF,
      uv: response.current.uv,
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
    };
  }
}

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
    required this.uv,
  });

  factory Day.fromJson(Map<String, dynamic> json) {
    return Day(
      maxtempC: (json['maxtemp_c'] ?? 0.0),
      maxtempF: (json['maxtemp_f'] ?? 0.0),
      mintempC: (json['mintemp_c'] ?? 0.0),
      mintempF: (json['mintemp_f'] ?? 0.0),
      avgtempC: (json['avgtemp_c'] ?? 0.0),
      avgtempF: (json['avgtemp_f'] ?? 0.0),
      maxwindMph: (json['maxwind_mph'] ?? 0.0),
      maxwindKph: (json['maxwind_kph'] ?? 0.0),
      totalprecipMm: json['totalprecip_mm'] ?? 0,
      totalprecipIn: json['totalprecip_in'] ?? 0,
      avgvisKm: json['avgvis_km'] ?? 0,
      avgvisMiles: json['avgvis_miles'] ?? 0,
      avghumidity: json['avghumidity'] ?? 0,
      dailyWillItRain: json['daily_will_it_rain'] ?? 0,
      dailyChanceOfRain: json['daily_chance_of_rain'] ?? 0,
      dailyWillItSnow: json['daily_will_it_snow'] ?? 0,
      dailyChanceOfSnow: json['daily_chance_of_snow'] ?? 0,
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
      'uv': uv,
    };
  }
}

class Forecast {
  final List<ForecastDay> forecastday;

  Forecast({required this.forecastday});

  factory Forecast.fromResponse(ForecastResponse response) {
    return Forecast(
      forecastday: response.forecast.forecastday as List<ForecastDay>,
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
  final List<Hour> hour;

  ForecastDay({
    required this.date,
    required this.dateEpoch,
    required this.day,
    required this.hour,
  });

  factory ForecastDay.fromJson(Map<String, dynamic> json) {
    return ForecastDay(
      date: json['date'] ?? '',
      dateEpoch: json['date_epoch'] ?? 0,
      day: Day.fromJson(json['day'] ?? {}),
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
      'hour': hour.map((item) => item.toJson()).toList(),
    };
  }
}

class Hour {
  final int timeEpoch;
  final String time;
  final double tempC;
  final double tempF;
  final int isDay;
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
    return Hour(
      timeEpoch: json['time_epoch'] ?? 0,
      time: json['time'] ?? '',
      tempC: (json['temp_c'] ?? 0.0),
      tempF: (json['temp_f'] ?? 0.0),
      isDay: json['is_day'] ?? 0,
      windMph: (json['wind_mph'] ?? 0.0),
      windKph: (json['wind_kph'] ?? 0.0),
      windDegree: json['wind_degree'] ?? 0,
      windDir: json['wind_dir'] ?? '',
      pressureMb: json['pressure_mb'] ?? 0,
      pressureIn: (json['pressure_in'] ?? 0.0),
      precipMm: json['precip_mm'] ?? 0,
      precipIn: json['precip_in'] ?? 0,
      humidity: json['humidity'] ?? 0,
      cloud: json['cloud'] ?? 0,
      feelslikeC: (json['feelslike_c'] ?? 0.0),
      feelslikeF: (json['feelslike_f'] ?? 0.0),
      windchillC: (json['windchill_c'] ?? 0.0),
      windchillF: (json['windchill_f'] ?? 0.0),
      heatindexC: (json['heatindex_c'] ?? 0.0),
      heatindexF: (json['heatindex_f'] ?? 0.0),
      dewpointC: (json['dewpoint_c'] ?? 0.0),
      dewpointF: (json['dewpoint_f'] ?? 0.0),
      willItRain: json['will_it_rain'] ?? 0,
      chanceOfRain: json['chance_of_rain'] ?? 0,
      willItSnow: json['will_it_snow'] ?? 0,
      chanceOfSnow: json['chance_of_snow'] ?? 0,
      visKm: json['vis_km'] ?? 0,
      visMiles: json['vis_miles'] ?? 0,
      gustMph: (json['gust_mph'] ?? 0.0),
      gustKph: (json['gust_kph'] ?? 0.0),
      uv: json['uv'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'time_epoch': timeEpoch,
      'time': time,
      'temp_c': tempC,
      'temp_f': tempF,
      'is_day': isDay,
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
  final String localtime;

  Location({
    required this.name,
    required this.region,
    required this.country,
    required this.localtime,
  });

  factory Location.fromResponse(ForecastResponse response) {
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

class WeatherForecastDto {
  final Location location;
  final Current current;
  final Forecast forecast;

  WeatherForecastDto({
    required this.forecast,
    required this.current,
    required this.location,
  });

  factory WeatherForecastDto.fromResponse(ForecastResponse response) {
    return WeatherForecastDto(
      forecast: Forecast.fromResponse(response),
      current: Current.fromResponse(response),
      location: Location.fromResponse(response),
    );
  }
}
