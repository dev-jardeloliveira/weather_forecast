import 'package:flutter/material.dart';

class WeatherDataForecastWidgets extends StatelessWidget {
  const WeatherDataForecastWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DraggableScrollableSheet(
      initialChildSize: 1,
      minChildSize: 0.2,
      maxChildSize: 1.0,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          color: theme.bottomSheetTheme.backgroundColor,
          child: ListView.builder(
            controller: scrollController,
            itemCount: 20, // Número de itens na lista
            itemBuilder: (BuildContext context, int index) {
              return ListTile(title: Text('Item $index'));
            },
          ),
        );
      },
    );
  }
}
