import 'dart:async';

import 'package:flutter/material.dart';

import '../../app_router.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    initializeAnimation();
    startNavigationTimer();
  }

  void initializeAnimation() {
    controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    animation = Tween<double>(begin: 0, end: 200).animate(controller)
      ..addListener(() {});

    controller.forward();
  }

  void startNavigationTimer() {
    Timer(
      const Duration(seconds: 3),
      () {
        navigateToHome();
      },
    );
  }

  void navigateToHome() {
    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoutes.home,
      (Route route) => false,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            return FlutterLogo(size: animation.value);
          },
        ),
      ),
    );
  }
}
