import 'package:flutter_test/flutter_test.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

void main() {
  final String groupName = 'startAngle';

  void generateTest(String testName, int testValue) {
    testWidgets("Check $testName [$groupName]", (WidgetTester tester) async {
      await tester.pumpWidget(SimpleCircularProgressBar(
        animationDuration: testValue,
      ));

      await tester.pump(Duration(seconds: 2));

      final simpleCircularProgressBar = find.byType(SimpleCircularProgressBar);
      await expectLater(
        simpleCircularProgressBar,
        matchesGoldenFile('$groupName$testName.png'),
      );
    });
  }

  group("Golden tests [$groupName]", ()
  {
    generateTest('Negative', -1);
    generateTest('Zero', 0);
    generateTest('LowPositive', 1);
    generateTest('MediumPositive', 4);
    generateTest('BigPositive', 10);
  });
}