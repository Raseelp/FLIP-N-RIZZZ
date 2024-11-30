import 'package:flipnrizz/loadingPage.dart';
import 'package:flipnrizz/util/msgProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const FlipNRizz());
}

class FlipNRizz extends StatelessWidget {
  const FlipNRizz({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FlipMessageProvider(),
      child: MaterialApp(
        theme: ThemeData(
          textTheme: const TextTheme(
            bodyMedium: TextStyle(fontFamily: 'bangers', letterSpacing: 2),
          ),
        ),
        home: const LoadingPage(),
      ),
    );
  }
}
