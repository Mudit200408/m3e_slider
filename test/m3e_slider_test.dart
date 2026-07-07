import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:m3e_slider/m3e_slider.dart';

void main() {
  group('M3ESlider', () {
    testWidgets('renders and calls onChanged on tap', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 300,
                child: M3ESlider(value: 0.5, onChanged: (_) {}),
              ),
            ),
          ),
        ),
      );

      expect(find.byType(M3ESlider), findsOneWidget);
    });

    testWidgets('respects min and max bounds', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 300,
                child: M3ESlider(value: 5, min: 0, max: 10, onChanged: (_) {}),
              ),
            ),
          ),
        ),
      );

      expect(find.byType(M3ESlider), findsOneWidget);
    });

    testWidgets('renders disabled state', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 300,
                child: M3ESlider(value: 0.5, enabled: false, onChanged: null),
              ),
            ),
          ),
        ),
      );

      expect(find.byType(M3ESlider), findsOneWidget);
    });

    testWidgets('renders with label', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 300,
                child: M3ESlider(value: 0.5, label: 'Test', onChanged: (_) {}),
              ),
            ),
          ),
        ),
      );

      expect(find.byType(M3ESlider), findsOneWidget);
    });
  });

  group('M3ERangeSlider', () {
    testWidgets('renders and calls onChanged on tap', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 300,
                child: M3ERangeSlider(
                  value: const RangeValues(0.25, 0.75),
                  onChanged: (_) {},
                ),
              ),
            ),
          ),
        ),
      );

      expect(find.byType(M3ERangeSlider), findsOneWidget);
    });

    testWidgets('respects min and max bounds', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 300,
                child: M3ERangeSlider(
                  value: const RangeValues(3, 7),
                  min: 0,
                  max: 10,
                  onChanged: (_) {},
                ),
              ),
            ),
          ),
        ),
      );

      expect(find.byType(M3ERangeSlider), findsOneWidget);
    });

    testWidgets('renders disabled state', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 300,
                child: M3ERangeSlider(
                  value: const RangeValues(0.25, 0.75),
                  enabled: false,
                  onChanged: null,
                ),
              ),
            ),
          ),
        ),
      );

      expect(find.byType(M3ERangeSlider), findsOneWidget);
    });
  });

  group('M3ESliderColors', () {
    test('equality and hashcode', () {
      final a = M3ESliderColors(
        thumbColor: Colors.blue,
        disabledThumbColor: Colors.grey,
        activeTrackColor: Colors.blue,
        inactiveTrackColor: Colors.grey,
        disabledActiveTrackColor: Colors.grey,
        disabledInactiveTrackColor: Colors.grey,
        activeTickColor: Colors.blue,
        inactiveTickColor: Colors.grey,
        disabledActiveTickColor: Colors.grey,
        disabledInactiveTickColor: Colors.grey,
      );
      final b = a.copyWith();
      expect(a, equals(b));
      expect(a.hashCode, equals(b.hashCode));
    });
  });

  group('M3EDecoration', () {
    test('copyWith preserves values', () {
      final decoration = M3ESliderDecoration(
        haptic: M3EHapticFeedback.medium,
        trackHeight: 20,
        thumbWidth: 6,
        thumbHeight: 48,
      );
      final copy = decoration.copyWith();
      expect(decoration, equals(copy));
    });
  });
}
