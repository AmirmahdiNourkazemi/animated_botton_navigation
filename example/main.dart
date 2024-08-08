import 'package:animated_botton_navigation/animated_botton_navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Animated Bottom Navigation Example',
      home: Scaffold(
        extendBody: true,
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
      height: 90,
      indicatorSpaceBotton: 40,
      iconSize: 32,
      icons: const [
        Icons.home,
        Icons.person,
        Icons.note,
        Icons.edit,
      ],
      pages: [
        Container(
          color: Colors.blue,
          child: const Center(child: Text('Page 1')),
        ),
        Container(
          color: Colors.lightBlue,
          child: const Center(
            child: Text('Page 2'),
          ),
        ),
        Container(
          color: Colors.deepPurple,
          child: const Center(child: Text('Page 3')),
        ),
        Container(
          color: Colors.yellow,
          child: const Center(child: Text('Page 4')),
        ),
      ],
    );
  }
}
