import 'package:flipnrizz/MultiThemeSelection.dart';
import 'package:flipnrizz/themeSelection.dart';
import 'package:flipnrizz/util/appColors.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

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
                'Flip N Rizzz',
                style: TextStyle(
                    color: AppColors.primaryText,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                textAlign: TextAlign.center,
                'Fly solo or flex in a faceoff—choose now!',
                style: TextStyle(
                    color: AppColors.primaryBlue,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: screenHeight * 0.01,
              ),
              Stack(
                children: [
                  Image.asset(
                    'assets/images/toop.png',
                    width: screenWidth * 1,
                  ),
                  Positioned(
                    top: screenHeight * 0.05,
                    left: screenWidth * 0.11,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ThemeSelection(),
                          ),
                        );
                      },
                      child: Transform.rotate(
                        angle: -0.3,
                        child: Container(
                          height: screenHeight * 0.2,
                          width: screenWidth * 0.35,
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight * 0.03,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
