<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

## animated_botton_navigation

[![GitHub license](https://img.shields.io/badge/license-MIT-lightgrey.svg)]()

An animated bottom navigation bar for Flutter, designed to provide a smooth and visually appealing transition between tabs.

![Animation](https://raw.githubusercontent.com/yourusername/animated_bottom_navigation/master/docs/animation.gif)

## Features

- Animated navigation bar with customizable animations.
- Customizable colors for selected and unselected icons.
- Customizable indicator and item decorations.
- Supports custom heights for the navigation bar.
- Allows setting custom `BoxDecoration` for the bottom navigation bar and its items.
## Preview

| Android  | iOS  |
| :------------------- | -------------------: |
| <img src="https://raw.githubusercontent.com/yourusername/animated_bottom_navigation/master/docs/emulator-android.gif" height="714">  | <img src="https://raw.githubusercontent.com/yourusername/animated_bottom_navigation/master/docs/emulator-ios.gif" height="714"> |

## Getting started


Add the dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  ...
  animated_bottom_navigation: ^0.0.1

## Basic Usage

```dart
import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation/animated_bottom_navigation.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Animated Bottom Navigation Example',
      home: Scaffold(
        bottomNavigationBar: ButtonNavigation(),
      ),
    );
  }
}

class ButtonNavigation extends StatelessWidget {
  const ButtonNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigation(
      height: 45,
      indicatorSpaceBotton: 10,
      icons: const [
        Icons.home,
        Icons.message,
        Icons.favorite,
        Icons.person,
      ],
      pages: const [
        Center(child: Text('Page 1')),
        Center(child: Text('Page 2')),
        Center(child: Text('Page 3')),
        Center(child: Text('Page 4')),
      ],
    );
  }
}

```
```

## LinkedIn
Connect with me on [LinkedIn](https://www.linkedin.com/in/amirmahdi-nourkazemi-04613023a/)
