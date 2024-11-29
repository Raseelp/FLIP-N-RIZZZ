import 'package:flipnrizz/GamePages/MultiPlayer/MultiThreeCrossTwo.dart';
import 'package:flipnrizz/GamePages/MultiPlayer/multiFiveCrossFour.dart';
import 'package:flipnrizz/GamePages/MultiPlayer/multiFourCrossThree.dart';
import 'package:flipnrizz/util/appColors.dart';
import 'package:flipnrizz/util/help.dart';
import 'package:flutter/material.dart';

class MultiDifficulty extends StatefulWidget {
  final int themeIndex;
  final String playerOne;
  final String playerTwo;
  const MultiDifficulty(
      {super.key,
      required this.themeIndex,
      required this.playerOne,
      required this.playerTwo});

  @override
  State<MultiDifficulty> createState() => _MultiDifficultyState();
}

class _MultiDifficultyState extends State<MultiDifficulty> {
  @override
  Widget build(BuildContext context) {
    Help help = Help();
    double screenWidth = MediaQuery.of(context).size.width;
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
                              builder: (context) => MultiThreeCrossTwo(
                                    themeIndex: widget.themeIndex,
                                    playerOne: widget.playerOne,
                                    playerTwo: widget.playerTwo,
                                  )),
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
                            builder: (context) => Multifourcrossthree(
                                playerOne: widget.playerOne,
                                playerTwo: widget.playerTwo,
                                themeIndex: widget.themeIndex),
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
                            builder: (context) => MultiFivecrossFour(
                                playerOne: widget.playerOne,
                                playerTwo: widget.playerTwo,
                                themeIndex: widget.themeIndex),
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
