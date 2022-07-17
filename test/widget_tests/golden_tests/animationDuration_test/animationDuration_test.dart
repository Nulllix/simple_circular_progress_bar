import 'package:flutter_test/flutter_test.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

void main() {
  final String groupName = 'animationDuration';

  void generateTest(String testName, Duration testValue) {
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
    generateTest('Negative', Duration(seconds: -1));
    generateTest('Zero', Duration());
    generateTest('LowPositive', Duration(seconds: 1));
    generateTest('MediumPositive', Duration(seconds: 4));
    generateTest('BigPositive', Duration(seconds: 10));
  });
}