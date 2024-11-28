import 'package:flipnrizz/GamePages/fourCrossThree.dart';
import 'package:flipnrizz/GamePages/iveCrossFour.dart';
import 'package:flipnrizz/GamePages/threeCrossTwo.dart';
import 'package:flipnrizz/util/appColors.dart';
import 'package:flutter/material.dart';

class DifficultySelection extends StatefulWidget {
  final int themeIndex;
  const DifficultySelection({
    super.key,
    required this.themeIndex,
  });

  @override
  State<DifficultySelection> createState() => _DifficultySelectionState();
}

class _DifficultySelectionState extends State<DifficultySelection> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.lightCyan,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Select Difficulty',
              style: TextStyle(
                  color: AppColors.primaryText,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
