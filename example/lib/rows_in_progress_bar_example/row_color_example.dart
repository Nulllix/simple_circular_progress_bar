import 'package:flutter/material.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class RowColorExample extends StatefulWidget {
  const RowColorExample({Key? key}) : super(key: key);

  @override
  _RowColorExampleState createState() =>
      _RowColorExampleState();
}

class _RowColorExampleState extends State<RowColorExample> {
  late ValueNotifier<double> valueNotifier;

  int count = 0;

  @override
  void initState() {
    super.initState();
    valueNotifier = ValueNotifier(100.0);
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: GestureDetector(
        onTap: () {
          count += 3;
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
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ==============================================
                // |           EXAMPLE CODE 1 (COLOR)           |
                // ==============================================
                SimpleCircularProgressBar(
                  key: ValueKey(count), // Ignore. You won't need it.
                  valueNotifier: valueNotifier,
                  progressColors: const [Colors.cyan],
                ),

                const SizedBox(width: 25,),

                // ==============================================
                // |           EXAMPLE CODE 2 (COLOR)           |
                // ==============================================
                SimpleCircularProgressBar(
                  key: ValueKey(count + 1), // Ignore. You won't need it.
                  valueNotifier: valueNotifier,
                  progressColors: const [Colors.cyan, Colors.purple],
                ),

                const SizedBox(width: 25,),

                // ==============================================
                // |           EXAMPLE CODE 3 (COLOR)           |
                // ==============================================
                SimpleCircularProgressBar(
                  key: ValueKey(count + 2), // Ignore. You won't need it.
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
