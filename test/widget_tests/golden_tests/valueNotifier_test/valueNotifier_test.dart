import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

void main() {
  const String groupName = 'valueNotifier';
  ValueNotifier<double>? valueNotifier;

  setUp(() {
    valueNotifier = ValueNotifier(0);
  });

  tearDown(() {
    valueNotifier!.dispose();
  });

  void generateTest() {
    testWidgets('Check [$groupName]', (WidgetTester tester) async {

      await tester.pumpWidget(SimpleCircularProgressBar(
        valueNotifier: valueNotifier,
      ));

      final simpleCircularProgressBar = find.byType(SimpleCircularProgressBar);

      valueNotifier!.value = 25;
      await tester.pumpAndSettle();

      await expectLater(
        simpleCircularProgressBar,
        matchesGoldenFile('${groupName}QuarterProgress.png'),
      );

      valueNotifier!.value = 50;
      await tester.pumpAndSettle();

      await expectLater(
        simpleCircularProgressBar,
        matchesGoldenFile('${groupName}HalfProgress.png'),
      );

      valueNotifier!.value = 75;
      await tester.pumpAndSettle();

      await expectLater(
        simpleCircularProgressBar,
        matchesGoldenFile('${groupName}ThreeQuartersProgress.png'),
      );
    });
  }

  group('Golden tests [$groupName]', generateTest);
}