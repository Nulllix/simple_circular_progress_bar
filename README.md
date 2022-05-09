Open source Flutter package, simple circular progress indicator.

# Getting Started
- [Installing](#Installing)
- [Basic Examples](#basic-examples)
    - [Colors](#colors)
    - [Start angle](#start-angle)
    - [Line thickness](#thickness-of-the-lines)
    - [Merge mode](#merge-mode)
    - [Animation time](#animation-time)
    - [Text](#text)
- [Value Notifier Example](#value-notifier-example)
- [Parameters description](#parameters-description)

# Installing
Add in pubspec.yaml:
```yaml
dependencies:
  flutter:
    sdk: flutter
  simple_circular_progress_bar: ^1.0.0
```

Now in your code, you can import:
```dart
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
```

# Basic examples
See the full example [here](https://github.com/Nulllix/simple_circular_progress_bar/tree/master/example/lib).
*Most of the examples are in the rows_in_progress_bar_example folder.*

Example numbers correspond to their numbers in the code.
To quickly find examples in the repository, look in the code: 'EXAMPLE CODE'.

## Colors
*TODO: ADD ANIMATION*
<details>
    <summary>Dart code</summary>

```dart
// Example 1
SimpleCircularProgressBar(
    progressColors: const [Colors.cyan],
)

// Example 2
SimpleCircularProgressBar(
    progressColors: const [Colors.cyan, Colors.purple],
),

// Example 3
SimpleCircularProgressBar(
    progressColors: const [
        Colors.cyan,
        Colors.green,
        Colors.amberAccent,
        Colors.redAccent,
        Colors.purpleAccent
    ],
    backColor: Colors.blueGrey,
),
```
</details>

&nbsp;

## Start angle
*TODO: ADD ANIMATION*
<details>
    <summary>Dart code</summary>

```dart
// Example 5
SimpleCircularProgressBar(
    startAngle: 45,
),

// Example 6
SimpleCircularProgressBar(
    startAngle: -270,
),
```
</details>

&nbsp;

### Thickness of the lines
*TODO: ADD ANIMATION*
<details>
    <summary>Dart code</summary>

```dart
// Example 8
SimpleCircularProgressBar(
    progressStrokeWidth: 20,
    backStrokeWidth: 10,
),

// Example 9
SimpleCircularProgressBar(
    backStrokeWidth: 0,
),
```
</details>

&nbsp;

## Merge mode
*TODO: ADD ANIMATION*
<details>
    <summary>Dart code</summary>

```dart
// Example 10
SimpleCircularProgressBar(
    progressColors: const [Colors.cyan],
    mergeMode: true,
),

// Example 11
SimpleCircularProgressBar(
    progressColors: const [Colors.cyan],
    fullProgressColor: Colors.deepOrangeAccent,
    mergeMode: true,
),

// Example 12
SimpleCircularProgressBar(
    progressColors: const [Colors.cyan, Colors.purpleAccent],
    mergeMode: true,
),
```
</details>

&nbsp;

## Animation time
*TODO: ADD ANIMATION*
<details>
    <summary>Dart code</summary>

```dart
// Example 13
SimpleCircularProgressBar(
    mergeMode: true,
    animationDuration: 1,
),

// Example 15
SimpleCircularProgressBar(
    mergeMode: true,
    animationDuration: 16,
),
```
</details>

&nbsp;

## Text
*TODO: ADD ANIMATION*
<details>
    <summary>Dart code</summary>

```dart
// Example 16
SimpleCircularProgressBar(
    mergeMode: true,
    onGetTextValue: (double value) {
        return '${value.toInt()}%';
    },
),

// Example 17
SimpleCircularProgressBar(
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
```
</details>

&nbsp;

# Value Notifier Example
*TODO: ADD ANIMATION*

You can read about how ValueNotifier works [here](https://medium.com/@avnishnishad/flutter-communication-between-widgets-using-valuenotifier-and-valuelistenablebuilder-b51ef627a58b).

The source code of the example can be found [here](https://github.com/Nulllix/simple_circular_progress_bar/blob/master/example/lib/value_notifier_example.dart).

# Parameters description

| Parameter                                       | Default | Description                                                                                                                                                                              |
|-------------------------------------------------|---------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **size** <br>*double*                           | 100     | Widget size.                                                                                                                                                                             |
| **maxValue**<br>*double*                        | 100     | The maximum value of the progress bar. The values will vary from 0 to [maxValue].                                                                                                        |
| **startAngle**<br>*double*                      | 0       | The angle from which the countdown of progress begins.                                                                                                                                   |
| **progressStrokeWidth**<br>*double*             | 15      | Thickness of the progress line.                                                                                                                                                          |
| **backStrokeWidth**<br>*double*                 | 15      | Line thickness of the background circle.                                                                                                                                                 |
| **progressColors**<br>*List<Color>*             |         | Progress bar can be either with or without a gradient. For a gradient, specify more than one color in the [progressColors] field and if a gradient is not needed specify only one color. |
| **fullProgressColor**<br>*Color*                |         | The color of the circle at 100% value. It only works when [mergeMode] equal to true.                                                                                                     |
| **backColor**<br>*Color*                        |         | The color of the background circle.                                                                                                                                                      |
| **animationDuration**<br>*int*                  | 6       | Animation duration in seconds.                                                                                                                                                           |
| **mergeMode**<br>*bool*                         | false   | When this mode is enabled the progress bar with a 100% value forms a full circle.                                                                                                        |
| **valueNotifier**<br>*ValueNotifier<double>*    |         | The object designed to update the value of the progress bar. By default, creates a ValueNotifier with the maximum value.                                                                 |
| **onGetTextValue**<br>*String Function(double)* |         | Callback to get a new text value centered in the progress bar.                                                                                                                           |
| **textValueStyle**<br>*Text Style*              |         | The style of the text placed in the center of the progress bar. 