import 'package:flipnrizz/GamePages/MultiPlayer/multiDifficulty.dart';
import 'package:flipnrizz/util/appColors.dart';
import 'package:flutter/material.dart';

class Multithemeselection extends StatelessWidget {
  final String playerOne;
  final String playerTwo;
  const Multithemeselection(
      {super.key, required this.playerOne, required this.playerTwo});

  @override
  Widget build(BuildContext context) {
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
              const Text(
                'Vibe Select',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: screenHeight * 0.07,
              ),
              const Text(
                textAlign: TextAlign.center,
                ' You think you can escape this meme world? Pick a theme or it picks YOU.',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: screenHeight * 0.04,
              ),
              Stack(
                children: [
                  Image.asset('assets/images/theme.png'),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MultiDifficulty(
                                themeIndex: 0,
                                playerOne: playerOne,
                                playerTwo: playerTwo,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          height: screenHeight * 0.21,
                          color: Colors.transparent,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MultiDifficulty(
                                themeIndex: 0,
                                playerOne: playerOne,
                                playerTwo: playerTwo,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          height: screenHeight * 0.20,
                          color: Colors.transparent,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MultiDifficulty(
                                themeIndex: 0,
                                playerOne: playerOne,
                                playerTwo: playerTwo,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          height: screenHeight * 0.20,
                          color: Colors.transparent,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
