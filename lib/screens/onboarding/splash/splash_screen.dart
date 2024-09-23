import 'dart:async';

import 'package:flutter/material.dart';

import '../../../utils/app_images.dart';
import '../../../utils/app_navigation.dart';
import '../../../utils/app_route_names.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((time) async {
      await Future.delayed(const Duration(seconds: 3), () {
        _navigate();
      });
    });
  }

  _navigate() {
    AppNavigation.pushNamed(context, AppRoutes.welcome);
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Image.asset(
        AppImages.splashLogo,
        fit: BoxFit.cover,
        width: screenWidth,
        height: screenHeight,
      ),
    );
  }
}
