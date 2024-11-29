import 'package:flipnrizz/MultiThemeSelection.dart';
import 'package:flipnrizz/util/appColors.dart';
import 'package:flutter/material.dart';

class CharactorSelect extends StatelessWidget {
  const CharactorSelect({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    TextEditingController nameOneController =
        TextEditingController(text: 'Sigma one');
    TextEditingController nameTwoController =
        TextEditingController(text: 'Sigma Two');

    return Scaffold(
      backgroundColor: AppColors.lightCyan,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: screenHeight * 0.47,
              child: Container(
                width: double.infinity,
                color: Colors.blue,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/chadbg.png',
                      width: screenWidth * 0.5,
                    ),
                    TextField(
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'bangers',
                        letterSpacing: 2,
                      ),
                      controller: nameOneController,
                      decoration:
                          const InputDecoration(border: InputBorder.none),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.09,
              child: Center(
                child: Column(
                  children: [
                    const Text(
                      'Two sigmas enter, one mogs—name yourselves!',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          side: const BorderSide(width: 2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                          backgroundColor: Colors.white),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Multithemeselection(
                                  playerOne: nameOneController.text,
                                  playerTwo: nameTwoController.text),
                            ));
                      },
                      child: const Text(
                        'Let The Duel begin',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontFamily: 'bangers',
                            letterSpacing: 2),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.5,
              child: Container(
                width: double.infinity,
                color: Colors.redAccent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/skbg.png',
                      width: screenWidth * 0.4,
                    ),
                    TextField(
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'bangers',
                        letterSpacing: 2,
                      ),
                      controller: nameTwoController,
                      decoration:
                          const InputDecoration(border: InputBorder.none),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
