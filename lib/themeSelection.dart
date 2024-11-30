import 'package:flipnrizz/difficultySelect.dart';
import 'package:flipnrizz/util/appColors.dart';
import 'package:flipnrizz/util/help.dart';
import 'package:flutter/material.dart';

class ThemeSelection extends StatelessWidget {
  const ThemeSelection({super.key});

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
              Container(
                height: screenHeight * 0.2,
                decoration: const BoxDecoration(color: AppColors.primaryAccent),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Vibe Select',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 40,
                              fontWeight: FontWeight.bold),
                        ),
                        GestureDetector(
                          onTap: () {
                            help.vibeSelectHelp(context);
                          },
                          child: Image.asset(
                            'assets/images/question.png',
                            width: screenHeight * 0.07,
                            height: screenWidth * 0.07,
                          ),
                        ),
                      ],
                    ),
                    const Text(
                      textAlign: TextAlign.center,
                      ' You think you can escape this meme world? Pick a theme or it picks YOU.',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: screenHeight * 0.05,
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
                              builder: (context) =>
                                  const DifficultySelection(themeIndex: 0),
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
                                builder: (context) =>
                                    const DifficultySelection(themeIndex: 1),
                              ));
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
                              builder: (context) =>
                                  const DifficultySelection(themeIndex: 2),
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
