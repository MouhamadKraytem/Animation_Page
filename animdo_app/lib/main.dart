// ignore_for_file: prefer_const_constructors

import 'package:animdo_app/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepPurple
      ),
      title: "Animdo",
      home: MyHomePage(),
    );
  }
}