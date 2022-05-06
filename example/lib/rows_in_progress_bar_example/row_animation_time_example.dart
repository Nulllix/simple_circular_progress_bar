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
                  key: ValueKey(count), // Ignore. You won't need it.
                  valueNotifier: valueNotifier,
                  mergeMode: true,
                  animationDuration: 1,
                ),

                const SizedBox(width: 25,),

                // ==============================================
                // |      EXAMPLE CODE 14 (ANIMATION TIME)      |
                // ==============================================
                SimpleCircularProgressBar(
                  key: ValueKey(count + 1), // Ignore. You won't need it.
                  valueNotifier: valueNotifier,
                  mergeMode: true,
                  animationDuration: 3,
                ),

                const SizedBox(width: 25,),

                // ==============================================
                // |      EXAMPLE CODE 15 (ANIMATION TIME)      |
                // ==============================================
                SimpleCircularProgressBar(
                  key: ValueKey(count + 2), // Ignore. You won't need it.
                  valueNotifier: valueNotifier,
                  mergeMode: true,
                  animationDuration: 16,
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
