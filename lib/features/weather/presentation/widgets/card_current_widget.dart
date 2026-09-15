import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_forecast/core/constants/app_color.dart';
import 'package:weather_forecast/core/constants/app_size.dart';
import 'package:weather_forecast/core/constants/app_string.dart';
import 'package:weather_forecast/features/weather/presentation/viewmodels/weather_vm.dart';

class CardCurrentWidget extends ConsumerWidget {
  // Replace with your actual currentTheme object
  const CardCurrentWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(weatherViewModelProvider);
    String iconUrl = '';
    double tempC = 0.0;
    String lastUpdated = '';
    String locationName = '';
    if (currentTheme.weatherCurrentDto != null) {
      iconUrl = currentTheme.weatherCurrentDto!.current.condition.icon;
      tempC = currentTheme.weatherCurrentDto!.current.tempC;
      lastUpdated = currentTheme.weatherCurrentDto?.current.lastUpdated ?? '';
      locationName = currentTheme.weatherCurrentDto?.location.name ?? '';
    }
    return Card.outlined(
      color: AppColor.white.withValues(alpha: 0.2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.size100),
      ),
      elevation: AppSize.size0,
      child: Padding(
        padding: const EdgeInsets.all(AppSize.size30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (iconUrl.isNotEmpty)
              Image.network(iconUrl, width: 50, height: 50, scale: 0.3),
            Text(
              '${tempC.toString()} °c',
              style: const TextStyle(
                fontSize: AppSize.size30,
                fontWeight: FontWeight.bold,
              ),
            ),

            Text(
              locationName,
              style: const TextStyle(
                fontSize: AppSize.size16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              AppString.titleLocation,
              style: TextStyle(
                fontSize: AppSize.size8,
                fontWeight: FontWeight.normal,
              ),
            ),

            Text(
              lastUpdated,
              style: const TextStyle(
                fontSize: AppSize.size10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
