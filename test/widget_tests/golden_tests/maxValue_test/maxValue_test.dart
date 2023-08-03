import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

void main() {
  const String groupName = 'maxValue';
  ValueNotifier<double>? valueNotifier;

  setUp(() {
    valueNotifier = ValueNotifier(10000);
  });

  tearDown(() {
    valueNotifier!.dispose();
  });
  
  void generateTest(String testName, double testValue) {
    testWidgets('Check $testName [$groupName]', (WidgetTester tester) async {
      final font = rootBundle.load('fonts/Roboto-Regular.ttf');

      final fontLoader = FontLoader('Roboto')..addFont(font);
      await fontLoader.load();

      const centerTextStyle = TextStyle(
        fontFamily: 'Roboto',
      );

      await tester.pumpWidget(SimpleCircularProgressBar(
        valueNotifier: valueNotifier,
        maxValue: testValue,
        onGetText: (value) => Text(
          '$value',
          textDirection: TextDirection.ltr,
          style: centerTextStyle,
        ),
      ));

      await tester.pumpAndSettle();

      final Finder centerText;
      if (testValue <= 0) {
        const double defaultMaxValue = 100;
        centerText = find.text('$defaultMaxValue');
      } else {
        centerText = find.text('$testValue');
      }

      expect(centerText, findsOneWidget);

      final simpleCircularProgressBar = find.byType(SimpleCircularProgressBar);
      await expectLater(
        simpleCircularProgressBar,
        matchesGoldenFile('$groupName$testName.png'),
      );
    });
  }

  group('Golden tests [$groupName]', () {
    generateTest('Negative', -1);
    generateTest('Zero', 0);
    generateTest('IntLowPositive', 1);
    generateTest('IntBigPositive', 400);
    generateTest('DoubleLowPositive', 0.33);
    generateTest('DoubleBigPositive', 500.45);
  });
}