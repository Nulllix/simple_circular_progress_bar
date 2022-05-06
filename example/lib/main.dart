import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'progress_bar_example.dart';
import 'value_notifier_example.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: const ProgressBarExample(),
      ),
    );
  }
}

class ExampleHome extends StatelessWidget {
  const ExampleHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle buttonStyle = ButtonStyle(
      textStyle: MaterialStateProperty.all(
        TextStyle(
          foreground: Paint()..color = Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        )
      ),
      minimumSize: MaterialStateProperty.all(const Size.fromHeight(60)),
      backgroundColor: MaterialStateProperty.all(Colors.indigo),
    );

    return Container(
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
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 20,),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ValueNotifierExample()),
                );
              },
              child: Text('Progress bar exapmle'.toUpperCase()),
              style: buttonStyle,
            ),
            const SizedBox(height: 20,),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ValueNotifierExample()),
                );
              },
              child: Text('Value notifier exapmle'.toUpperCase()),
              style: buttonStyle,
            ),
          ],
        ),
      ),
    );
  }
}
