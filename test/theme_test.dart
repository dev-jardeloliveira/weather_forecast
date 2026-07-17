// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_forecast/core/constants/app_string.dart';
import 'package:weather_forecast/features/weather/presentation/viewmodels/weather_vm.dart';
import 'package:weather_forecast/features/weather/presentation/views/weather_view.dart';

import 'mock_storage.dart';

void main() {
  late MockStorage mockStorange;

  setUp(() {
    mockStorange = MockStorage();
  });
  group('Test struct', () {
    testWidgets(
      'Deve exibir a estrutura do app, appbar, titulo, botão config',
      (WidgetTester tester) async {
        // Build our app and trigger a frame.
        await tester.pumpWidget(
          const ProviderScope(
            child: MaterialApp(home: Scaffold(body: WeatherView())),
          ),
        );

        expect(find.text(AppString.weather), findsOneWidget);
        expect(find.byIcon(Icons.settings), findsOneWidget);
      },
    );

    testWidgets('Deve exibir um texto no corpo do app.', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(home: Scaffold(body: WeatherView())),
        ),
      );

      expect(find.text(AppString.temporary), findsOneWidget);
    });

    testWidgets('Deve exibir o openBottomSheet', (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [storageServicesProvider.overrideWithValue(mockStorange)],
          child: const MaterialApp(home: Scaffold(body: WeatherView())),
        ),
      );

      await tester.tap(find.byIcon(Icons.settings));
      await tester.pumpAndSettle();

      expect(find.text(AppString.selectThemeOptions), findsOneWidget);
      expect(find.text(AppString.light), findsOneWidget);
      expect(find.text(AppString.dark), findsOneWidget);
    });
  });

  group('Deve exibir o openBottomSheet e alternar entre os tempos', () {
    testWidgets('Deve alternar entre os temas', (WidgetTester tester) async {
      await mockStorange.set(key: 'themeMode', value: 0);
      await tester.pumpWidget(
        ProviderScope(
          overrides: [storageServicesProvider.overrideWithValue(mockStorange)],
          child: const MaterialApp(home: Scaffold(body: WeatherView())),
        ),
      );

      // Open the bottom sheet
      await tester.tap(find.byIcon(Icons.settings));
      await tester.pumpAndSettle();

      // Verify the initial state of the ToggleButtons
      final buttonToggle = tester.widget<ToggleButtons>(
        find.byType(ToggleButtons),
      );
      expect(buttonToggle.isSelected, [true, false]);
      // Verify the text of the ToggleButtons
      expect(find.text(AppString.light), findsOneWidget);
      expect(find.text(AppString.dark), findsOneWidget);
      // Tap the dark theme button
      await tester.tap(find.text(AppString.dark));
      await tester.pumpAndSettle();
      // Verify the state of the ToggleButtons after tapping the dark theme button
      final buttonToggle2 = tester.widget<ToggleButtons>(
        find.byType(ToggleButtons),
      );
      expect(buttonToggle2.isSelected, [false, true]);
      // Tap the closed button
      await tester.tap(find.byIcon(Icons.close));
      await tester.pumpAndSettle();
      // Reopen the bottom sheet
      await tester.tap(find.byIcon(Icons.settings));
      await tester.pumpAndSettle();
      // Verify the state of the ToggleButtons after reopening the bottom sheet
      final buttonToggleReOpen = tester.widget<ToggleButtons>(
        find.byType(ToggleButtons),
      );
      expect(buttonToggleReOpen.isSelected, [false, true]);
      // Tap the light theme button
      await tester.tap(find.text(AppString.light));
      await tester.pumpAndSettle();
      // Verify the state of the ToggleButtons after tapping the light theme button
      final buttonToggleReopenLight = tester.widget<ToggleButtons>(
        find.byType(ToggleButtons),
      );
      expect(buttonToggleReopenLight.isSelected, [true, false]);
    });
  });
}
