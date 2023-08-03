import 'package:flutter/material.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class RowColorExample extends StatefulWidget {
  const RowColorExample({Key? key}) : super(key: key);

  @override
  State<RowColorExample> createState() => _RowColorExampleState();
}

class _RowColorExampleState extends State<RowColorExample> {
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
          setState(() {});
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'SELECT PROGRESS LINE COLOR',
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
                // |           EXAMPLE CODE 1 (COLOR)           |
                // ==============================================
                SimpleCircularProgressBar(
                  valueNotifier: valueNotifier,
                  progressColors: const [Colors.cyan],
                ),

                const SizedBox(
                  width: 25,
                ),

                // ==============================================
                // |           EXAMPLE CODE 2 (COLOR)           |
                // ==============================================
                SimpleCircularProgressBar(
                  valueNotifier: valueNotifier,
                  progressColors: const [Colors.cyan, Colors.purple],
                ),

                const SizedBox(
                  width: 25,
                ),

                // ==============================================
                // |           EXAMPLE CODE 3 (COLOR)           |
                // ==============================================
                SimpleCircularProgressBar(
                  valueNotifier: valueNotifier,
                  progressColors: const [
                    Colors.cyan,
                    Colors.green,
                    Colors.amberAccent,
                    Colors.redAccent,
                    Colors.purpleAccent
                  ],
                  backColor: Colors.blueGrey,
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
