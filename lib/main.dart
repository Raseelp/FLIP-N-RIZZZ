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
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            fontFamily: 'myfont',
          ),
        ),
        // Apply the same font to all other default text styles if needed.
      ),
      home: Homepage(),
    );
  }
}
