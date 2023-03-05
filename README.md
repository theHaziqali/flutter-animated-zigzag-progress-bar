# Animated Zig-Zag Progress Bar

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![Pub](https://img.shields.io/pub/v/animated_zigzag_progress_bar.svg)](https://pub.dev/packages/animated_zigzag_progress_bar)

This Flutter widget allows you to create a custom, animated zig-zag progress bar. The progress bar is highly customizable, allowing you to adjust its height, width, color, and animation speed. The widget is easy to integrate into your Flutter app and can be used to display progress in a visually appealing way.

## Features

- Customizable height, width, and color
- Animated zig-zag progress bar
- Smooth animation with customizable speed
- Easy to integrate into Flutter apps

## Usage

To use the animated zig-zag progress bar in your Flutter app, simply add the `animated_zigzag_progress_bar` package to your dependencies in `pubspec.yaml`:

```yaml
dependencies:
  animated_zigzag_progress_bar: ^1.0.0
  ```

Then, import the package in your Dart code:
```
import 'package:animated_zigzag_progress_bar/animated_zigzag_progress_bar.dart';
```
To create a progress bar, simply call the AnimatedZigZagProgressBar widget:

```
AnimatedZigZagProgressBar(
  percentage: 0.5,
  height: 20.0,
  width: 300.0,
  color: Colors.blue,
  duration: Duration(milliseconds: 500),
)
```
#Example
```
import 'package:flutter/material.dart';
import 'package:animated_zigzag_progress_bar/animated_zigzag_progress_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zig-Zag Progress Bar Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Zig-Zag Progress Bar Demo'),
        ),
        body: Center(
          child: AnimatedZigZagProgressBar(
            percentage: 0.75,
            height: 20.0,
            width: 300.0,
            color: Colors.blue,
            duration: Duration(milliseconds: 500),
          ),
        ),
      ),
    );
  }
}
```
#License
This project is licensed under the terms of the MIT license.


