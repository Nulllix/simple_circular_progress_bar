import 'package:flutter_test/flutter_test.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

void main() {
  final String groupName = 'mergeMode';

  void generateTest(String testName, bool testValue) {
    testWidgets("Check $testName [$groupName]", (WidgetTester tester) async {
      await tester.pumpWidget(SimpleCircularProgressBar(
        mergeMode: testValue,
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
    generateTest('Enable', true);
    generateTest('Disable', false);
  });
}