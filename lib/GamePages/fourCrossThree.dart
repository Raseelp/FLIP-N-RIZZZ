import 'dart:async';

import 'package:flipnrizz/util/appColors.dart';
import 'package:flipnrizz/util/gameLogic.dart';
import 'package:flutter/material.dart';

class FourCrossThree extends StatefulWidget {
  final int themeIndex;
  const FourCrossThree({super.key, required this.themeIndex});

  @override
  State<FourCrossThree> createState() => _FourCrossThreeState();
}

class _FourCrossThreeState extends State<FourCrossThree> {
  int tries = 0;
  int scores = 0;
  int matches = 0;

  Timer? _timer; // Timer instance
  bool _isTimerActive = false;
  bool _isCardFlipping = false;

  int _secondsElapsed = 0;
  late Game _game;
  @override
  void initState() {
    _game = Game(widget.themeIndex, cardCount: 12);
    super.initState();
    _game.initGame();
    _game.generateImages(12);

    startOrContinueTimer();
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel the timer to prevent memory leaks
    super.dispose();
  }

  void startOrContinueTimer() {
    if (!_isTimerActive) {
      // Only start the timer if it's not already running
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        setState(() {
          _secondsElapsed++;
        });
      });
      _isTimerActive = true;
    }
  }

  void stopTimer() {
    _timer?.cancel();
    _isTimerActive = false;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.lightCyan,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: screenWidth * 0.9,
              height: screenHeight * 0.25,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(0),
                  ),
                  border: Border.all()),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: () {
                        _game.showPauseDialog(
                            context, stopTimer, startOrContinueTimer);
                      },
                      icon: Icon(
                        Icons.pause_presentation_sharp,
                        color: Colors.black,
                        size: screenHeight * .05,
                      )),
                  Container(
                    width: screenWidth * 0.23,
                    height: screenHeight * 0.09,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0),
                      border: Border.all(),
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'RIZZCOINS',
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            '$scores',
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: screenWidth * 0.23,
                    height: screenHeight * 0.09,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0),
                      border: Border.all(),
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'brainflips',
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            '$tries',
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: screenWidth * 0.23,
                    height: screenHeight * 0.09,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0),
                      border: Border.all(),
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Ticktock',
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            '${(_secondsElapsed ~/ 60).toString().padLeft(2, '0')}:${(_secondsElapsed % 60).toString().padLeft(2, '0')}',
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenHeight * 0.02),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 40,
                    crossAxisSpacing: 20,
                  ),
                  itemCount: _game.gameImg!.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: _isCardFlipping
                          ? null
                          : () {
                              if (_game.gameImg![index] !=
                                  _game.hiddenCardPath) {
                                return;
                              }

                              // Prevent consecutive taps on the same card
                              if (_game.matchCheck.isNotEmpty &&
                                  _game.matchCheck.any(
                                      (entry) => entry.keys.first == index)) {
                                return;
                              }
                              setState(() {
                                tries++;
                                _game.gameImg![index] = _game.cardsList[index];
                                _game.matchCheck
                                    .add({index: _game.cardsList[index]});
                              });
                              if (_game.matchCheck.length == 2) {
                                if (_game.matchCheck[0].values.first ==
                                        _game.matchCheck[1].values.first &&
                                    _game.matchCheck[0].keys.first !=
                                        _game.matchCheck[1].keys.first) {
                                  scores += 100;
                                  matches++;
                                  if (matches == 6) {
                                    String time =
                                        '${(_secondsElapsed ~/ 60).toString().padLeft(2, '0')}:${(_secondsElapsed % 60).toString().padLeft(2, '0')}';
                                    _game.showVictoryDiolog(tries, scores,
                                        stopTimer, context, time);
                                  }

                                  _game.matchCheck.clear();
                                } else {
                                  setState(() {
                                    _isCardFlipping =
                                        true; // Prevent further taps
                                  });
                                  Future.delayed(Duration(milliseconds: 500),
                                      () {
                                    setState(() {
                                      _game.gameImg![_game.matchCheck[0].keys
                                          .first] = _game.hiddenCardPath;
                                      _game.gameImg![_game.matchCheck[1].keys
                                          .first] = _game.hiddenCardPath;
                                      _game.matchCheck.clear();
                                      _isCardFlipping = false;
                                    });
                                  });
                                }
                              }
                            },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: AssetImage(_game.gameImg![index]),
                                fit: BoxFit.cover)),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
