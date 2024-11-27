import 'package:flipnrizz/homePage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(FlipNRizz());
}

class FlipNRizz extends StatelessWidget {
  const FlipNRizz({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Homepage(),
    );
  }
}
