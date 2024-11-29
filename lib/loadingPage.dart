import 'dart:async';

import 'package:flipnrizz/homePage.dart';
import 'package:flutter/material.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  double _progressValue = 0.0;

  @override
  void initState() {
    super.initState();
    _startLoading();
  }

  void _startLoading() {
    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {
        if (_progressValue < 1.0) {
          _progressValue += 0.02;
        } else {
          timer.cancel();
          _navigateToHome();
        }
      });
    });
  }

  void _navigateToHome() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Homepage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/loading.png'),
              const Text(
                "Loading...",
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              const SizedBox(height: 20),
              LinearProgressIndicator(
                value: _progressValue,
                backgroundColor: Colors.white,
                color: Colors.black,
                minHeight: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
