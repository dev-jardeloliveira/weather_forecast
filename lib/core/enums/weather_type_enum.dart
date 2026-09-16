enum WeatherCondition {
  sunny('assets/images/sunny.gif'),
  cloudy('assets/images/cloudy.gif'),
  raining('assets/images/raining.gif'),
  night('assets/images/night.gif'),
  snow('assets/images/snow.gif'),
  fog('assets/images/fog.gif'),
  thunder('assets/images/thunder.gif');

  final String path;
  const WeatherCondition(this.path);
  static String getWeatherImage(int? code, DateTime timestamp) {
    switch (code) {
      case 1000:
        return timestamp.hour >= 6 && timestamp.hour < 18
            ? WeatherCondition.sunny.path
            : WeatherCondition.night.path;

      case 1003:
      case 1006:
      case 1009:
        return WeatherCondition.cloudy.path;

      // chuva
      case 1063:
      case 1150:
      case 1153:
      case 1180:
      case 1183:
      case 1186:
      case 1189:
      case 1192:
      case 1195:
      case 1240:
      case 1243:
      case 1246:
        return WeatherCondition.raining.path;

      // neve
      case 1066:
      case 1114:
      case 1117:
      case 1210:
      case 1213:
      case 1216:
      case 1219:
      case 1222:
      case 1225:
      case 1255:
      case 1258:
        return WeatherCondition.snow.path;

      // trovão
      case 1087:
      case 1273:
      case 1276:
      case 1279:
      case 1282:
        return WeatherCondition.thunder.path;

      // névoa
      case 1030:
      case 1135:
      case 1147:
        return WeatherCondition.fog.path;

      default:
        return timestamp.hour >= 6 && timestamp.hour < 18
            ? WeatherCondition.sunny.path
            : WeatherCondition.night.path;
    }
  }
}
