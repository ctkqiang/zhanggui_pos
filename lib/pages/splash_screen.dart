// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  String? name;

  SplashScreen({super.key, required name});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [Text(widget.name!)],
        ),
      ),
    );
  }
}
