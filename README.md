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

## preview

<img src="https://raw.githubusercontent.com/AmirmahdiNourkazemi/animated_botton_navigation/master/3.gif" alt="Animation" width="400">



## Features

- Animated navigation bar with customizable animations.
- Customizable colors for selected and unselected icons.
- Customizable indicator and item decorations.
- Supports custom heights for the navigation bar.
- Allows setting custom `BoxDecoration` for the bottom navigation bar and its items.

## Getting started


Add the dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  ...
  animated_bottom_navigation: ^0.0.1
```

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
      height: 70,
      indicatorSpaceBotton: 30,
      iconSize: 32,
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
### Parameters

- **`icons`**: A list of icons to be displayed in the bottom navigation bar.
- **`pages`**: A list of pages corresponding to each icon.
- **`iconSize`**: The height of icon.
- **`backgroundColor`**: The background color of the bottom navigation bar.
- **`selectedColor`**: The color of the selected icon.
- **`unselectedColor`**: The color of unselected icons.
- **`animationDuration`**: The duration of the tab transition animation.
- **`animationIndicatorCurve`**: The curve used for the tab transition animation for indicator.
- **`animationIconCurve`**: The curve used for the tab transition animation for icons.
- **`indicatorDecoration`**: Decoration for the indicator that shows the selected tab.
- **`itemDecoration`**: Decoration for the individual navigation items.
- **`bottonNavigationDecoration`**: Decoration for the bottom navigation bar.
- **`height`**: The height of the bottom navigation bar.
- **`indicatorHeight`**: The height of the indicator.
- **`indicatorSpaceBotton`**: The space between the indicator and the bottom of the bar.


## LinkedIn
Connect with me on [LinkedIn](https://www.linkedin.com/in/amirmahdi-nourkazemi-04613023a/)
