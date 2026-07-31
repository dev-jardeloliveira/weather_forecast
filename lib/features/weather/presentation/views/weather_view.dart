import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_forecast/core/constants/app_size.dart';
import 'package:weather_forecast/core/constants/app_string.dart';
import 'package:weather_forecast/features/weather/presentation/viewmodels/weather_vm.dart';
import 'package:weather_forecast/features/weather/presentation/widgets/open_bottom_sheet_widgets.dart';

class WeatherView extends ConsumerWidget {
  const WeatherView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(weatherViewModelProvider.notifier);
    final currentTheme = ref.watch(weatherViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppString.weather),
        actions: [
          IconButton(
            onPressed: () => _openBottomSheet(
              context,
              viewModel,
              currentTheme.selectedTheme,
            ),
            icon: const Icon(Icons.settings, size: AppSize.size20),
          ),
        ],
      ),
      body: Column(
        children: [
          Center(child: Text(currentTheme.weatherCurrentDto!.location.name)),
          TextButton(
            onPressed: () =>
                viewModel.searchDataWeather(city: 'Ponte Nova', lang: 'pt-br'),
            child: const Text('Carregar'),
          ),
        ],
      ),
    );
  }

  void _openBottomSheet(
    BuildContext context,
    WeatherViewModel viewModel,
    int selectCurrent,
  ) {
    final mediaQuery = MediaQuery.of(context);
    showModalBottomSheet(
      isDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return OpenBottomSheetWidgets(
          mediaQuery: mediaQuery,
          viewModel: viewModel,
          selectCurrent: selectCurrent,
        );
      },
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppSize.size20),
        ),
      ),
    );
  }
}
