import 'package:flutter/material.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class ValueNotifierExample extends StatelessWidget {
  const ValueNotifierExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<double> valueNotifier = ValueNotifier(0.0);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xff0d324d),
              Color(0xff7f5a83),
            ],
          )
        ),
        alignment: Alignment.center,
        child: Column (
          children: [
            const SizedBox(height: 50,),
            SimpleCircularProgressBar(
              size: 200,
              valueNotifier: valueNotifier,
              progressStrokeWidth: 24,
              backStrokeWidth: 24,
              mergeMode: true,
              onGetTextValue: (value) => '${value.toInt()}',
              progressColors: const [Colors.cyan, Colors.purple],
              textValueStyle: const TextStyle(
                fontSize: 64,
                color: Colors.lightBlue,
                fontWeight: FontWeight.bold,
              ),
              backColor: Colors.black.withOpacity(0.4),
            ),
            const SizedBox(height: 50,),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: TextField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                keyboardAppearance: Brightness.dark,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.black.withOpacity(0.4),
                  hintText: 'Enter value (max 100)',
                  hintStyle: TextStyle(color: Colors.black.withOpacity(0.9)),
                ),
                style: const TextStyle(fontSize: 25, color: Colors.white),
                onSubmitted: (inputText) {
                  final double newValue = double.parse(inputText);
                  valueNotifier.value = newValue;
                },
              ),
            )
          ],
        )
      ),
    );
  }
}
