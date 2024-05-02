// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, no_leading_underscores_for_local_identifiers, avoid_unnecessary_containers

import 'dart:math';

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  double _buttonRaduis = 100;
  double _textSize = 15;

  final Tween<double> _backgrounfScalle = Tween<double>(begin: 0.0, end: 1.0);

  AnimationController? _starAnimationController;
  @override
  void initState() {
    super.initState();
    _starAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 4));

    _starAnimationController!.repeat();
  }

  @override
  Widget build(BuildContext context) {
    //Animated*
    //Animated Container
    //
    return Scaffold(
      body: Container(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            _background_page(),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [_circularAnimationButton(), _starIcon()],
            ),
          ],
        ),
      ),
    );
  }

  Widget _background_page() {
    return TweenAnimationBuilder(
      curve: Curves.fastLinearToSlowEaseIn,
      tween: _backgrounfScalle,
      duration: Duration(seconds: 1),
      builder: (_context, _scale, _child) {
        return Transform.scale(
          scale: _scale,
          child: _child,
        );
      },
      child: Container(
        color: Colors.blueAccent,
      ),
    );
  }

  Widget _circularAnimationButton() {
    return Center(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _buttonRaduis += _buttonRaduis == 200 ? -100 : 100;
            _textSize += _textSize == 15 ? 15 : -15;
          });
        },
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          curve: Curves.linear,
          height: _buttonRaduis,
          width: _buttonRaduis,
          decoration: BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.circular(_buttonRaduis)),
          child: Center(
            child: Text(
              "Basic !",
              style:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: _textSize),
            ),
          ),
        ),
      ),
    );
  }

  Widget _starIcon() {
    return AnimatedBuilder(
      animation: _starAnimationController!.view,
      builder: (_buildContext, _child) {
        return Transform.rotate(
          angle: _starAnimationController!.value * 2 * pi,
          child: _child,
        );
      },
      child: Icon(
        Icons.star,
        size: 100,
        color: const Color.fromARGB(255, 64, 188, 175),
      ),
    );
  }
}
