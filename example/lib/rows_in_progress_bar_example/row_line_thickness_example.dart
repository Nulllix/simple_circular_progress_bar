import 'package:flutter/material.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class RowLineThicknessExample extends StatefulWidget {
  const RowLineThicknessExample({Key? key}) : super(key: key);

  @override
  _RowLineThicknessExampleState createState() =>
      _RowLineThicknessExampleState();
}

class _RowLineThicknessExampleState extends State<RowLineThicknessExample> {
  late ValueNotifier<double> valueNotifier;

  int keyForRepaint = 0;

  @override
  void initState() {
    super.initState();
    valueNotifier = ValueNotifier(0.0);
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: GestureDetector(
        key: ValueKey(keyForRepaint),
        onTap: () {
          valueNotifier.value = 100.0;
          keyForRepaint++;
          setState(() { });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'SELECT THE THICKNESS OF THE LINES',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white.withOpacity(0.5),
              ),
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ==============================================
                // |       EXAMPLE CODE 7 (LINE THICKNESS)      |
                // ==============================================
                SimpleCircularProgressBar(
                  valueNotifier: valueNotifier,
                  size: 80,
                  progressStrokeWidth: 25,
                  backStrokeWidth: 25,
                ),

                const SizedBox(width: 25,),

                // ==============================================
                // |       EXAMPLE CODE 8 (LINE THICKNESS)      |
                // ==============================================
                SimpleCircularProgressBar(
                  valueNotifier: valueNotifier,
                  size: 90,
                  progressStrokeWidth: 20,
                  backStrokeWidth: 10,
                ),

                const SizedBox(width: 25,),

                // ==============================================
                // |       EXAMPLE CODE 9 (LINE THICKNESS)      |
                // ==============================================
                SimpleCircularProgressBar(
                  valueNotifier: valueNotifier,
                  backStrokeWidth: 0,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    valueNotifier.dispose();
    super.dispose();
  }
}
