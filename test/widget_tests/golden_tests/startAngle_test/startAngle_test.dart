import 'package:flutter_test/flutter_test.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

void main() {
  final String groupName = 'startAngle';
  
  void generateTest(String testName, double testValue) {
    testWidgets("Check $testName [$groupName]", (WidgetTester tester) async {
      await tester.pumpWidget(SimpleCircularProgressBar(
        startAngle: testValue,
      ));

      await tester.pumpAndSettle();

      final simpleCircularProgressBar = find.byType(SimpleCircularProgressBar);
      await expectLater(
        simpleCircularProgressBar,
        matchesGoldenFile('$groupName$testName.png'),
      );
    });
  }

  group("Golden tests [$groupName]", () {
    generateTest('Negative', -90);
    generateTest('Zero', 0);
    generateTest('IntLowPositive', 1);
    generateTest('IntMediumPositive', 45);
    generateTest('IntBigPositive', 540);
    generateTest('DoubleLowPositive', 0.33);
    generateTest('DoubleBigPositive', 500.45);
  });
}