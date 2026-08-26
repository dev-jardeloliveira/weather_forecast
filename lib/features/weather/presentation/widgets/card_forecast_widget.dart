import 'package:flutter/material.dart';
import 'package:weather_forecast/core/constants/app_size.dart';
import 'package:weather_forecast/features/weather/data/models/weather_forecast_dto.dart';

class CardForecastWidget extends StatelessWidget {
  final ForecastDayDto forecastDto;
  const CardForecastWidget({super.key, required this.forecastDto});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSize.size30),
        child: Row(
          children: [
            Image.network(
              forecastDto.day.condition.icon,
              width: 30,
              height: 30,
              centerSlice: Rect.fromCircle(
                center: const Offset(0, 0),
                radius: 100,
              ),
              fit: BoxFit.contain,
            ),
            const SizedBox(width: AppSize.size20),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text('min: ', style: TextStyle(fontSize: AppSize.size10)),
                Text('${forecastDto.day.mintempC.toString()} ºC   '),
                const Text('max: ', style: TextStyle(fontSize: AppSize.size10)),
                Text('${forecastDto.day.maxtempC.toString()} ºC   '),
              ],
            ),
            const SizedBox(width: AppSize.size20),
            const Text('uv: '),
            Text(forecastDto.day.uv.toString()),
          ],
        ),
      ),
    );
  }
}
