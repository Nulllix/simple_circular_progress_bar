import 'package:flutter/material.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class RowAnimationTimeExample extends StatefulWidget {
  const RowAnimationTimeExample({Key? key}) : super(key: key);

  @override
  _RowAnimationTimeExampleState createState() =>
      _RowAnimationTimeExampleState();
}

class _RowAnimationTimeExampleState extends State<RowAnimationTimeExample> {
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
              'SELECT ANIMATION TIME',
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
                // |      EXAMPLE CODE 13 (ANIMATION TIME)      |
                // ==============================================
                SimpleCircularProgressBar(
                  valueNotifier: valueNotifier,
                  mergeMode: true,
                  animationDuration: 1,
                ),

                const SizedBox(width: 25,),

                // ==============================================
                // |      EXAMPLE CODE 14 (ANIMATION TIME)      |
                // ==============================================
                SimpleCircularProgressBar(
                  valueNotifier: valueNotifier,
                  mergeMode: true,
                  animationDuration: 3,
                ),

                const SizedBox(width: 25,),

                // ==============================================
                // |      EXAMPLE CODE 15 (ANIMATION TIME)      |
                // ==============================================
                SimpleCircularProgressBar(
                  valueNotifier: valueNotifier,
                  mergeMode: true,
                  animationDuration: 6,
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
