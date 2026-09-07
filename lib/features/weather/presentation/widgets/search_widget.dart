import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_forecast/core/constants/app_string.dart';
import 'package:weather_forecast/features/weather/presentation/viewmodels/weather_vm.dart';

class SearchWidget extends ConsumerWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(weatherViewModelProvider.notifier);
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 370),
      child: SearchBar(
        hintText: AppString.searchCity,
        leading: const Icon(Icons.search),
        onSubmitted: (value) {
          final city = value.trim();
          if (city.isNotEmpty && city.length >= 3) {
            viewModel.searchDataWeather(city: city, lang: 'pt-br', days: 14);
          }
        },
      ),
    );
  }
}
