import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tsm_app/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 4),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (conteSxt) =>
              const HomeScreen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 50.0),
        child: Column(
          children: [
            Expanded(
              child: Center(
                  child: Image.asset(
                'assets/logo.png',
                height: 200,
                width: 210,
              )),
            ),
            const Text(
              "Total system school management",
              style: TextStyle(
                  color: Color.fromARGB(255, 71, 71, 71), fontSize: 20),
            ),
            const Text(
              "TSM@Echo 2024",
              style: TextStyle(
                  color: Color.fromARGB(255, 71, 71, 71), fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
