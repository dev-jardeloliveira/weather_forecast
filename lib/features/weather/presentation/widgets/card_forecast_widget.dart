import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_forecast/core/constants/app_color.dart';
import 'package:weather_forecast/core/constants/app_size.dart';
import 'package:weather_forecast/features/weather/data/models/weather_forecast_dto.dart';

class CardForecastWidget extends StatelessWidget {
  final ForecastDayDto forecastDto;
  const CardForecastWidget({super.key, required this.forecastDto});

  @override
  Widget build(BuildContext context) {
    DateTime? date = DateTime.tryParse(forecastDto.date) != null
        ? DateTime.parse(forecastDto.date)
        : DateTime.now();

    return Card(
      color: AppColor.white.withValues(alpha: 0.5),
      child: Padding(
        padding: const EdgeInsets.all(AppSize.size25),
        child: Row(
          spacing: AppSize.size10,
          children: [
            Column(
              children: [
                Image.network(
                  forecastDto.day.condition.icon,
                  width: AppSize.size30,
                  height: AppSize.size30,
                  centerSlice: Rect.fromCircle(
                    center: const Offset(0, 0),
                    radius: 100,
                  ),
                  fit: BoxFit.contain,
                ),
                Text(
                  DateFormat('EEEE').format(date),
                  style: const TextStyle(fontSize: AppSize.size12),
                ),
              ],
            ),

            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'min: ',
                    style: TextStyle(fontSize: AppSize.size10),
                  ),
                  Text('${forecastDto.day.mintempC.toString()}ºc   '),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'max: ',
                    style: TextStyle(fontSize: AppSize.size10),
                  ),
                  Text('${forecastDto.day.maxtempC.toString()}ºc   '),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  const Text('uv:', style: TextStyle(fontSize: AppSize.size10)),
                  Text(forecastDto.day.uv.toString()),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  const Text('um:', style: TextStyle(fontSize: AppSize.size10)),
                  Text(forecastDto.day.avghumidity.toString()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
