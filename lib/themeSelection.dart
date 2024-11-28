import 'package:flipnrizz/difficultySelect.dart';
import 'package:flipnrizz/util/appColors.dart';
import 'package:flutter/material.dart';

class ThemeSelection extends StatelessWidget {
  const ThemeSelection({super.key});

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
                'Level of Ohio-ness',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
              Stack(
                children: [
                  Image.asset('assets/images/ohio.png'),
                  Positioned(
                    top: screenHeight * 0.07,
                    left: screenWidth * 0.05,
                    child: const Text(
                      'WAIT,ITS ALL OHIO?',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Positioned(
                    top: screenHeight * 0.005,
                    right: screenWidth * 0.15,
                    child: Container(
                      color: Colors.transparent,
                      height: screenHeight * 0.2,
                      width: screenWidth * 0.2,
                      child: const Text(
                        'Pick your vibe.',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: screenHeight * 0.04,
              ),
              Stack(
                children: [
                  Image.asset('assets/images/threeop.png'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
