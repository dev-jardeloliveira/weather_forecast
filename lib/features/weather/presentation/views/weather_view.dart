import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_forecast/core/constants/app_size.dart';
import 'package:weather_forecast/core/constants/app_string.dart';
import 'package:weather_forecast/features/weather/presentation/widgets/open_bottom_sheet_widgets.dart';

class WeatherView extends ConsumerWidget {
  const WeatherView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppString.weather),
        actions: [
          IconButton(
            onPressed: () => _openBottomSheet(context),
            icon: const Icon(Icons.settings, size: AppSize.size20),
          ),
        ],
      ),
      body: const Center(child: Text(AppString.temporary)),
    );
  }

  void _openBottomSheet(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    showModalBottomSheet(
      isDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return OpenBottomSheetWidgets(mediaQuery: mediaQuery);
      },
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppSize.size20),
        ),
      ),
    );
  }
}
