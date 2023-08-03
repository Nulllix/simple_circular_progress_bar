import 'package:flutter/material.dart';
import 'package:simple_circular_progress_bar_example/rows_in_progress_bar_example/row_animation_time_example.dart';
import 'package:simple_circular_progress_bar_example/rows_in_progress_bar_example/row_line_thickness_example.dart';
import 'package:simple_circular_progress_bar_example/rows_in_progress_bar_example/row_merge_mode_example.dart';
import 'package:simple_circular_progress_bar_example/rows_in_progress_bar_example/row_start_angle_example.dart';
import 'package:simple_circular_progress_bar_example/rows_in_progress_bar_example/row_text_or_image_example.dart';

import 'rows_in_progress_bar_example/row_color_example.dart';

class ProgressBarExample extends StatelessWidget {
  const ProgressBarExample({Key? key}) : super(key: key);

  Widget generateRow({
    required String text,
    required ValueNotifier valueNotifier,
    required List<Widget> children,
  }) {
    return RepaintBoundary(
      child: GestureDetector(
        onTap: () {
          if (valueNotifier.value == 100.0) {
            valueNotifier.value = 0.0;
          } else {
            valueNotifier.value = 100.0;
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white.withOpacity(0.5),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xff0d324d),
            Color(0xff7f5a83),
          ],
        )),
        alignment: Alignment.center,
        child: ListView(
          children: const [
            SizedBox(
              height: 20,
            ),
            // EXAMPLES CODE 1, 2, 3
            RowColorExample(),
            SizedBox(
              height: 40,
            ),
            // EXAMPLES CODE 4, 5, 6
            RowStartAngleExample(),
            SizedBox(
              height: 40,
            ),
            // EXAMPLES CODE 7, 8, 9
            RowLineThicknessExample(),
            SizedBox(
              height: 40,
            ),
            // EXAMPLES CODE 10, 11, 12
            RowMergeModeExample(),
            SizedBox(
              height: 40,
            ),
            // EXAMPLES CODE 13, 14, 15
            RowAnimationTimeExample(),
            SizedBox(
              height: 40,
            ),
            // EXAMPLES CODE 16, 17, 18
            RowTextOrImageExample(),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
