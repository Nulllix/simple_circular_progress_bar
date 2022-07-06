import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

void main() {
  group("Check number of elements", () {
    // Auxiliary function to check the number of elements without text
    void checkNumberElementsWithoutText() async {
      final stack = find.byType(Stack);
      await expectLater(stack, findsOneWidget);

      final animatedBuilder = find.byType(AnimatedBuilder);
      await expectLater(animatedBuilder, findsOneWidget);

      final customPaint = find.byType(CustomPaint);
      await expectLater(customPaint, findsOneWidget);

      final sizedBox = find.byType(SizedBox);
      await expectLater(sizedBox, findsOneWidget);

      final text = find.byType(Text);
      await expectLater(text, findsNothing);
    }

    // Auxiliary function to check the number of elements with text
    void checkNumberElementsWithText() async {
      final stack = find.byType(Stack);
      await expectLater(stack, findsOneWidget);

      final animatedBuilder = find.byType(AnimatedBuilder);
      await expectLater(animatedBuilder, findsOneWidget);

      final customPaint = find.byType(CustomPaint);
      await expectLater(customPaint, findsOneWidget);

      final sizedBox = find.byType(SizedBox);
      await expectLater(sizedBox, findsNothing);

      final text = find.byType(Text);
      await expectLater(text, findsOneWidget);
    }

    testWidgets("Check number of elements [before animation] [without text]",
        (WidgetTester tester) async {
      await tester.pumpWidget(SimpleCircularProgressBar());

      checkNumberElementsWithoutText();
    });

    testWidgets("Check number of elements [before animation] [with text]",
        (WidgetTester tester) async {
      await tester.pumpWidget(SimpleCircularProgressBar(
        onGetText: (value) => Text('$value', textDirection: TextDirection.ltr),
      ));

      checkNumberElementsWithText();
    });

    testWidgets("Check number of elements [during animation] [without text]",
        (WidgetTester tester) async {
      await tester.pumpWidget(SimpleCircularProgressBar());

      await tester.pump(Duration(seconds: 3));

      checkNumberElementsWithoutText();
    });

    testWidgets("Check number of elements [during animation] [with text]",
        (WidgetTester tester) async {
      await tester.pumpWidget(SimpleCircularProgressBar(
        onGetText: (value) => Text('$value', textDirection: TextDirection.ltr),
      ));

      await tester.pump(Duration(seconds: 3));

      checkNumberElementsWithText();
    });

    testWidgets("Check number of elements [after animation] [without text]",
        (WidgetTester tester) async {
      await tester.pumpWidget(SimpleCircularProgressBar());

      await tester.pumpAndSettle();

      checkNumberElementsWithoutText();
    });

    testWidgets("Check number of elements [after animation] [with text]",
        (WidgetTester tester) async {
      await tester.pumpWidget(SimpleCircularProgressBar(
        onGetText: (value) => Text('$value', textDirection: TextDirection.ltr),
      ));

      await tester.pumpAndSettle();

      checkNumberElementsWithText();
    });
  });
}
