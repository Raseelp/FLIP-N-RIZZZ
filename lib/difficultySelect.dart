import 'package:flipnrizz/GamePages/fourCrossThree.dart';
import 'package:flipnrizz/GamePages/iveCrossFour.dart';
import 'package:flipnrizz/GamePages/threeCrossTwo.dart';
import 'package:flipnrizz/util/appColors.dart';
import 'package:flipnrizz/util/help.dart';
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
    Help help = Help();
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.lightCyan,
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: screenHeight * 0.07,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Level of Ohio-ness',
                    style: TextStyle(
                        color: AppColors.primaryText,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      help.difficultySelecttHelp(context);
                    },
                    child: Image.asset(
                      'assets/images/question.png',
                      width: screenHeight * 0.07,
                      height: screenWidth * 0.07,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              Image.asset('assets/images/ohio.png'),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              Stack(children: [
                Image.asset('assets/images/threeopt.png'),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ThreeCrossTwo(themeIndex: widget.themeIndex)),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        height: screenHeight * 0.175,
                        color: Colors.transparent,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                FourCrossThree(themeIndex: widget.themeIndex),
                          ),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        height: screenHeight * 0.16,
                        color: Colors.transparent,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                FiveCrossFour(themeIndex: widget.themeIndex),
                          ),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        height: screenHeight * 0.175,
                        color: Colors.transparent,
                      ),
                    )
                  ],
                )
              ])
            ],
          ),
        ),
      ),
    );
  }
}
