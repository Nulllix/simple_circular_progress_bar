import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

void main() {
  const String groupName = 'backColor';

  void generateTest(String testName, Color testValue) {
    testWidgets('Check $testName [$groupName]', (WidgetTester tester) async {
      await tester.pumpWidget(SimpleCircularProgressBar(
        backColor: testValue,
      ));

      final simpleCircularProgressBar = find.byType(SimpleCircularProgressBar);
      await expectLater(
        simpleCircularProgressBar,
        matchesGoldenFile('$groupName$testName.png'),
      );
    });
  }

  group('Golden tests [$groupName]', () {
    generateTest('Red', Colors.red);
    generateTest('Green', Colors.green);
  });
}