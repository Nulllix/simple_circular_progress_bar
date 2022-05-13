import 'package:flutter/material.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class RowMergeModeExample extends StatefulWidget {
  const RowMergeModeExample({Key? key}) : super(key: key);

  @override
  _RowMergeModeExampleState createState() => _RowMergeModeExampleState();
}

class _RowMergeModeExampleState extends State<RowMergeModeExample> {
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
      key: ValueKey(keyForRepaint),
      child: GestureDetector(
        onTap: () {
          valueNotifier.value = 100.0;
          keyForRepaint++;
          setState(() {});
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'ENABLE MERGE MODE',
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
              children: [
                // ==============================================
                // |        EXAMPLE CODE 10 (MERGE MODE)        |
                // ==============================================
                SimpleCircularProgressBar(
                  valueNotifier: valueNotifier,
                  progressColors: const [Colors.cyan],
                  mergeMode: true,
                ),

                const SizedBox(
                  width: 25,
                ),

                // ==============================================
                // |        EXAMPLE CODE 11 (MERGE MODE)        |
                // ==============================================
                SimpleCircularProgressBar(
                  valueNotifier: valueNotifier,
                  progressColors: const [Colors.cyan],
                  fullProgressColor: Colors.deepOrangeAccent,
                  mergeMode: true,
                ),

                const SizedBox(
                  width: 25,
                ),

                // ==============================================
                // |        EXAMPLE CODE 12 (MERGE MODE)        |
                // ==============================================
                SimpleCircularProgressBar(
                  valueNotifier: valueNotifier,
                  progressColors: const [Colors.cyan, Colors.purpleAccent],
                  mergeMode: true,
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
