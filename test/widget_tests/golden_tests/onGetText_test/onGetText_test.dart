import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

void main() {
  const String groupName = 'onGetText';
  final Duration animDuration = const Duration(seconds: 8);

  void generateTest(String testName, Duration pumpDuration,
      String? textExtension, Color? textColor) {
    testWidgets('Check $testName [$groupName]', (WidgetTester tester) async {
      final font = rootBundle.load('fonts/Roboto-Regular.ttf');

      final fontLoader = FontLoader('Roboto')..addFont(font);
      await fontLoader.load();

      final centerTextStyle = TextStyle(
        fontFamily: 'Roboto',
        color: textColor,
        fontSize: 32,
      );

      textExtension = textExtension ?? '';

      await tester.pumpWidget(SimpleCircularProgressBar(
        maxValue: animDuration.inSeconds.toDouble(),
        animationDuration: animDuration,
        onGetText: (value) => Text(
          '${value.toInt()}${textExtension!}',
          textDirection: TextDirection.ltr,
          style: centerTextStyle,
        ),
      ));

      await tester.pump(pumpDuration);

      final centerText = find.text('${pumpDuration.inSeconds}${textExtension!}');
      expect(centerText, findsOneWidget);

      final simpleCircularProgressBar = find.byType(SimpleCircularProgressBar);
      await expectLater(
        simpleCircularProgressBar,
        matchesGoldenFile('$groupName$testName.png'),
      );
    });
  }

  group('Golden tests [$groupName]', () {
    generateTest('QuarterProgress', const Duration(seconds: 2), null, null);
    generateTest('HalfProgress', const Duration(seconds: 4), null, null);
    generateTest('FullProgress', animDuration, null, null);
    generateTest('TextWithPercent', animDuration, '%', null);
    generateTest('TextColorRed', animDuration, null, Colors.red);
  });
}
