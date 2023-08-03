import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

void main() {
  const String groupName = 'progressColors';
  ValueNotifier<double>? valueNotifier;

  setUp(() {
    valueNotifier = ValueNotifier(0);
  });

  tearDown(() {
    valueNotifier!.dispose();
  });

  void generateTest(String testName, List<Color> testValue, double progress) {
    testWidgets('Check $testName [$groupName]', (WidgetTester tester) async {
      await tester.pumpWidget(SimpleCircularProgressBar(
        valueNotifier: valueNotifier,
        progressColors: testValue,
      ));

      valueNotifier!.value = progress;

      await tester.pumpAndSettle();

      final simpleCircularProgressBar = find.byType(SimpleCircularProgressBar);
      await expectLater(
        simpleCircularProgressBar,
        matchesGoldenFile('$groupName$testName.png'),
      );
    });
  }

  group('Golden tests [$groupName]', () {
    generateTest('ZeroFullProgress', [], 100);
    generateTest('OneColorFullProgress', [Colors.red], 100);
    generateTest('TwoColorsFullProgress', [Colors.red, Colors.green], 100);
    generateTest('MoreColorsFullProgress', [Colors.red, Colors.green,
      Colors.blue, Colors.yellow, Colors.purple, Colors.brown], 100);
    generateTest('MoreColorsLowProgress', [Colors.red, Colors.green,
      Colors.blue, Colors.yellow, Colors.purple, Colors.brown], 1);
    generateTest('MoreColorsMediumProgress', [Colors.red, Colors.green,
      Colors.blue, Colors.yellow, Colors.purple, Colors.brown], 50);
  });
}