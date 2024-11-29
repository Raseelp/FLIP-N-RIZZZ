import 'package:flipnrizz/loadingPage.dart';
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
          bodyMedium: TextStyle(fontFamily: 'bangers', letterSpacing: 2),
        ),
      ),
      home: LoadingPage(),
    );
  }
}
