import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_forecast/core/constants/app_color.dart';
import 'package:weather_forecast/core/constants/app_string.dart';
import 'package:weather_forecast/features/weather/presentation/viewmodels/weather_vm.dart';

class SearchWidget extends ConsumerWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(weatherViewModelProvider.notifier);
    return Container(
      margin: const EdgeInsets.only(top: 100, left: 10, right: 10, bottom: 10),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 300, maxHeight: 50),
        child: SearchBar(
          backgroundColor: WidgetStateProperty.all(
            AppColor.white.withValues(alpha: 0.6),
          ),
          hintText: AppString.searchCity,
          hintStyle: WidgetStateProperty.all(
            const TextStyle(color: AppColor.black),
          ),
          leading: const Icon(Icons.search),
          onSubmitted: (value) {
            final city = value.trim();
            if (city.isNotEmpty && city.length >= 3) {
              viewModel.searchDataWeather(city: city, lang: 'pt-br', days: 14);
            }
          },
        ),
      ),
    );
  }
}
