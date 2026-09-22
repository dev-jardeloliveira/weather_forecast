import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_forecast/core/enums/weather_type_enum.dart';
import 'package:weather_forecast/features/weather/presentation/viewmodels/weather_vm.dart';

class ImageBackgroundWidget extends ConsumerWidget {
  final Widget? child;
  const ImageBackgroundWidget({super.key, this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(
      weatherViewModelProvider.select(
        (state) => state.weatherCurrentDto?.current,
      ),
    );
    DateTime? timestamp = viewModel?.lastUpdated != null
        ? DateTime.parse(viewModel!.lastUpdated)
        : DateTime.now();
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          opacity: 0.8,
          // Carrega o recurso de imagem local
          image: AssetImage(
            WeatherCondition.getWeatherImage(
              viewModel?.condition.code ?? 1000,
              timestamp,
            ),
          ),
          // Ajusta a imagem para preencher a tela, preservando a proporção e cortando o excesso
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
