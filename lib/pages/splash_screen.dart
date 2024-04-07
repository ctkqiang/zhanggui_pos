// ignore_for_file: must_be_immutable

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zhanggui_pos/pages/account_setup.dart';

class SplashScreen extends StatefulWidget {
  String? name;

  SplashScreen({super.key, required name});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final interval = const Duration(seconds: 1);
  final int timerMaxSeconds = 5;

  int currentSeconds = 0;

  String get timerText {
    return ((timerMaxSeconds - currentSeconds) % 60).toString();
  }

  startTimeout([int? milliseconds]) {
    final duration = interval;

    Timer.periodic(duration, (timer) {
      setState(() {
        currentSeconds = timer.tick;
        if (timer.tick >= timerMaxSeconds) timer.cancel();
      });
    });
  }

  Future<void> onNavigate() async {
    Get.to(AccountSetup());
  }

  @override
  void initState() {
    startTimeout();

    super.initState();

    Future.delayed(Duration(seconds: timerMaxSeconds), () => onNavigate());
  }

  @override
  Widget build(BuildContext context) {
    final skip = Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
      child: ElevatedButton(
        onPressed: onNavigate,
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          fixedSize: const Size(100, 45),
          backgroundColor: Colors.grey.withOpacity(1),
          elevation: 0.0,
          shadowColor: Colors.transparent,
        ),
        child: Text(
          "$timerText 跳过",
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );

    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/app.png",
          fit: BoxFit.fitWidth,
        ),
      ),
      backgroundColor: Colors.white,
      floatingActionButton: skip,
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    );
  }
}
