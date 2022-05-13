import 'package:flutter/material.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class RowTextExample extends StatefulWidget {
  const RowTextExample({Key? key}) : super(key: key);

  @override
  _RowTextExampleState createState() => _RowTextExampleState();
}

class _RowTextExampleState extends State<RowTextExample> {
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
              'ADD TEXT',
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
                // |           EXAMPLE CODE 16 (TEXT)           |
                // ==============================================
                SimpleCircularProgressBar(
                  valueNotifier: valueNotifier,
                  mergeMode: true,
                  onGetText: (double value) {
                    return Text('${value.toInt()}%');
                  },
                ),

                const SizedBox(
                  width: 25,
                ),

                // ==============================================
                // |           EXAMPLE CODE 17 (TEXT)           |
                // ==============================================
                SimpleCircularProgressBar(
                  valueNotifier: valueNotifier,
                  mergeMode: true,
                  onGetText: (double value) {
                    return Text(
                      '${value.toInt()}',
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    );
                  },
                ),

                const SizedBox(
                  width: 25,
                ),

                // ==============================================
                // |           EXAMPLE CODE 18 (TEXT)           |
                // ==============================================
                SimpleCircularProgressBar(
                  valueNotifier: valueNotifier,
                  mergeMode: true,
                  onGetText: (double value) {
                    TextStyle centerTextStyle = TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.greenAccent.withOpacity(value * 0.01),
                    );

                    return Text(
                      '${value.toInt()}',
                      style: centerTextStyle,
                    );
                  },
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
