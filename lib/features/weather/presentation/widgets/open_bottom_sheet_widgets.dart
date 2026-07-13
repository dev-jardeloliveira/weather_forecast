import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_forecast/core/constants/app_size.dart';
import 'package:weather_forecast/core/constants/app_string.dart';
import 'package:weather_forecast/features/weather/presentation/viewmodels/weather_vm.dart';

class OpenBottomSheetWidgets extends StatelessWidget {
  final MediaQueryData mediaQuery;

  const OpenBottomSheetWidgets({super.key, required this.mediaQuery});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final viewModel = ref.watch(weatherViewModelProvider.notifier);
        final currentTheme = ref.watch(weatherViewModelProvider);

        return SizedBox(
          height: mediaQuery.size.height * 0.3,
          child: Padding(
            padding: const EdgeInsets.all(AppSize.size16),
            child: Column(
              spacing: AppSize.size16,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppString.settings,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.close, size: AppSize.size24),
                    ),
                  ],
                ),

                const Center(child: Text(AppString.selectThemeOptions)),

                ToggleButtons(
                  isSelected: currentTheme.selectedTheme == 0
                      ? [true, false]
                      : [false, true],
                  onPressed: (int index) {
                    viewModel.toggleTheme();
                  },
                  children: [
                    const Text(AppString.light),
                    const Text(AppString.dark),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
