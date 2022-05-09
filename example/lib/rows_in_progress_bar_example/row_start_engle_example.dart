import 'package:flutter/material.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class RowStartEngleExample extends StatefulWidget {
  const RowStartEngleExample({Key? key}) : super(key: key);

  @override
  _RowStartEngleExampleState createState() =>
      _RowStartEngleExampleState();
}

class _RowStartEngleExampleState extends State<RowStartEngleExample> {
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
              'SELECT START ENGLE',
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
                // |        EXAMPLE CODE 4 (START ENGLE)        |
                // ==============================================
                SimpleCircularProgressBar(
                  valueNotifier: valueNotifier,
                ),

                const SizedBox(width: 25,),

                // ==============================================
                // |        EXAMPLE CODE 5 (START ENGLE)        |
                // ==============================================
                SimpleCircularProgressBar(
                  valueNotifier: valueNotifier,
                  startAngle: 45,
                ),

                const SizedBox(width: 25,),

                // ==============================================
                // |        EXAMPLE CODE 6 (START ENGLE)        |
                // ==============================================
                SimpleCircularProgressBar(
                  valueNotifier: valueNotifier,
                  startAngle: -270,
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
