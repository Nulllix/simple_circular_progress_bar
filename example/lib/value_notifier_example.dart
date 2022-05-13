import 'package:flutter/material.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class ValueNotifierExample extends StatefulWidget {
  const ValueNotifierExample({Key? key}) : super(key: key);

  @override
  State<ValueNotifierExample> createState() => _ValueNotifierExampleState();
}

class _ValueNotifierExampleState extends State<ValueNotifierExample> {
  final centerTextStyle = const TextStyle(
    fontSize: 64,
    color: Colors.lightBlue,
    fontWeight: FontWeight.bold,
  );

  late ValueNotifier<double> valueNotifier;

  @override
  void initState() {
    super.initState();
    valueNotifier = ValueNotifier(0.0);
  }

  @override
  Widget build(BuildContext context) {
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
          )),
          alignment: Alignment.center,
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              SimpleCircularProgressBar(
                size: 200,
                valueNotifier: valueNotifier,
                progressStrokeWidth: 24,
                backStrokeWidth: 24,
                mergeMode: true,
                onGetText: (value) {
                  return Text(
                    '${value.toInt()}',
                    style: centerTextStyle,
                  );
                },
                progressColors: const [Colors.cyan, Colors.purple],
                backColor: Colors.black.withOpacity(0.4),
              ),
              const SizedBox(
                height: 50,
              ),
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

                    // As soon as we change the value of the valueNotifier
                    // parameter, the function ValueListenableBuilder within
                    // SimpleCircularProgressBar is called.
                    valueNotifier.value = newValue;
                  },
                ),
              )
            ],
          )),
    );
  }

  @override
  void dispose() {
    valueNotifier.dispose();
    super.dispose();
  }
}
