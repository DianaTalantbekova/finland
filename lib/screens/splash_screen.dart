import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key,});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () => context.go('/onboarding1'));
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/png/splash.png',
      fit: BoxFit.cover,
    );
  }
}