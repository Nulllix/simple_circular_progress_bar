import 'package:flutter_test/flutter_test.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

void main() {
  const String groupName = 'size';

   void generateTest(String testName, double testValue) {
    testWidgets('Check $testName [$groupName]', (WidgetTester tester) async {
      await tester.pumpWidget(SimpleCircularProgressBar(
        size: testValue,
      ));

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