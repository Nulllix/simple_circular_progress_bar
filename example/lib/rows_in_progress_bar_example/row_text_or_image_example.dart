import 'package:flutter/material.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class RowTextOrImageExample extends StatefulWidget {
  const RowTextOrImageExample({Key? key}) : super(key: key);

  @override
  State<RowTextOrImageExample> createState() => _RowTextOrImageExampleState();
}

class _RowTextOrImageExampleState extends State<RowTextOrImageExample> {
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
          Future.delayed(const Duration(seconds: 1), () {
            valueNotifier.value = 100.0;
            keyForRepaint++;
            setState(() {});
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'ADD TEXT OR IMAGE',
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
                // |           EXAMPLE CODE 16 (IMAGE)          |
                // ==============================================
                SimpleCircularProgressBar(
                  valueNotifier: valueNotifier,
                  mergeMode: true,
                  centerChild: (double value, double maxValue) {
                    TextStyle centerTextStyle = TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.greenAccent.withOpacity(value * 0.01),
                    );

                    return Row(
                      children: [
                        Icon(
                          value == maxValue
                              ? Icons.download_done
                              : Icons.downloading,
                          color: Colors.greenAccent.withOpacity(value * 0.01),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${value.toInt()}%',
                          style: centerTextStyle,
                        ),
                      ],
                    );
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
                  onGetText: (double value, double maxValue) {
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
                  onGetText: (double value, double maxValue) {
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
