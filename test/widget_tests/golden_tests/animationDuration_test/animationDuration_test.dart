import 'package:flutter_test/flutter_test.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

void main() {
  const String groupName = 'animationDuration';

  void generateTest(String testName, Duration testValue) {
    testWidgets('Check $testName [$groupName]', (WidgetTester tester) async {
      await tester.pumpWidget(SimpleCircularProgressBar(
        animationDuration: testValue,
      ));

      await tester.pump(const Duration(seconds: 2));

      final simpleCircularProgressBar = find.byType(SimpleCircularProgressBar);
      await expectLater(
        simpleCircularProgressBar,
        matchesGoldenFile('$groupName$testName.png'),
      );
    });
  }

  group('Golden tests [$groupName]', ()
  {
    generateTest('Negative', const Duration(seconds: -1));
    generateTest('Zero', const Duration());
    generateTest('LowPositive', const Duration(seconds: 1));
    generateTest('MediumPositive', const Duration(seconds: 4));
    generateTest('BigPositive', const Duration(seconds: 10));
  });
}