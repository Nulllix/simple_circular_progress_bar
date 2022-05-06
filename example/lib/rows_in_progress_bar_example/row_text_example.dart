import 'package:flutter/material.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class RowTextExample extends StatefulWidget {
  const RowTextExample({Key? key}) : super(key: key);

  @override
  _RowTextExampleState createState() =>
      _RowTextExampleState();
}

class _RowTextExampleState extends State<RowTextExample> {
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
              'ADD TEXT',
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
                // |           EXAMPLE CODE 16 (TEXT)           |
                // ==============================================
                SimpleCircularProgressBar(
                  key: ValueKey(count), // Ignore. You won't need it.
                  valueNotifier: valueNotifier,
                  mergeMode: true,
                  onGetTextValue: (double value) {
                    return '${value.toInt()}%';
                  },
                ),

                const SizedBox(width: 25,),

                // ==============================================
                // |           EXAMPLE CODE 17 (TEXT)           |
                // ==============================================
                SimpleCircularProgressBar(
                  key: ValueKey(count + 1), // Ignore. You won't need it.
                  valueNotifier: valueNotifier,
                  mergeMode: true,
                  onGetTextValue: (double value) {
                    return '${value.toInt()}';
                  },
                  textValueStyle: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
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
