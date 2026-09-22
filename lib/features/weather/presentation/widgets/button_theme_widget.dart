import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_forecast/core/constants/app_size.dart';
import 'package:weather_forecast/features/weather/presentation/viewmodels/weather_vm.dart';
import 'package:weather_forecast/features/weather/presentation/widgets/open_bottom_sheet_widgets.dart';

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
      borderRadius: BorderRadius.vertical(top: Radius.circular(AppSize.size20)),
    ),
  );
}

class ButtonThemeWidget extends ConsumerWidget {
  const ButtonThemeWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: () {
        final viewModel = ref.read(weatherViewModelProvider.notifier);
        final currentTheme = ref.read(weatherViewModelProvider);
        _openBottomSheet(context, viewModel, currentTheme.selectedTheme);
      },
      icon: const Icon(Icons.settings, size: AppSize.size20),
    );
  }
}
