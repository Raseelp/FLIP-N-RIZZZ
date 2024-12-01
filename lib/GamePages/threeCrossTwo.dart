import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flipnrizz/util/appColors.dart';
import 'package:flipnrizz/util/gameLogic.dart';
import 'package:flipnrizz/util/msgProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThreeCrossTwo extends StatefulWidget {
  final int themeIndex;
  const ThreeCrossTwo({super.key, required this.themeIndex});

  @override
  State<ThreeCrossTwo> createState() => _ThreeCrossTwoState();
}

class _ThreeCrossTwoState extends State<ThreeCrossTwo> {
  final AudioPlayer _gamePageAudioPlayer = AudioPlayer();
  int tries = 0;
  int scores = 0;
  int match = 0;
  bool _isCardFlipping = false;
  bool isSuccess = false;
  Timer? _timer;
  bool _isTimerActive = false;
  int _secondsElapsed = 0;
  late Game _game;
  @override
  void initState() {
    _game = Game(widget.themeIndex, cardCount: 6);
    super.initState();
    _game.initGame();
    _game.generateImages(6);

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
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
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
              height: screenHeight * 0.24,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(0),
                ),
                border: Border.all(),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: screenHeight * 0.03,
                  ),
                  Row(
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
                                'RizzCoins',
                                style: TextStyle(fontSize: 18),
                              ),
                              Text(
                                '$scores',
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
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
                                'BRAINFLIPS',
                                style: TextStyle(fontSize: 18),
                              ),
                              Text(
                                '$tries',
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
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
                            color: Colors.white,
                            border: Border.all()),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'ticktock',
                                style: TextStyle(fontSize: 18),
                              ),
                              Text(
                                '${(_secondsElapsed ~/ 60).toString().padLeft(2, '0')}:${(_secondsElapsed % 60).toString().padLeft(2, '0')}',
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Consumer<FlipMessageProvider>(
                    builder: (context, provider, child) {
                      return isSuccess
                          ? Container(
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  color: AppColors.emeraldGreen,
                                  borderRadius: BorderRadius.circular(0)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  textAlign: TextAlign.center,
                                  provider.message,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          : Container(
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  color: AppColors.primaryAccent,
                                  borderRadius: BorderRadius.circular(0)),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  textAlign: TextAlign.center,
                                  provider.message,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            );
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenHeight * 0.02),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 30,
                    crossAxisSpacing: 20,
                  ),
                  itemCount: _game.gameImg!.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap:
                          _isCardFlipping // Disable tapping if cards are flipping
                              ? null
                              : () {
                                  if (_game.gameImg![index] !=
                                      _game.hiddenCardPath) {
                                    return;
                                  }

                                  // Prevent consecutive taps on the same card
                                  if (_game.matchCheck.isNotEmpty &&
                                      _game.matchCheck.any((entry) =>
                                          entry.keys.first == index)) {
                                    return;
                                  }
                                  setState(() {
                                    tries++;
                                    _game.gameImg![index] =
                                        _game.cardsList[index];
                                    _game.matchCheck
                                        .add({index: _game.cardsList[index]});
                                  });
                                  if (_game.matchCheck.length == 2) {
                                    if (_game.matchCheck[0].values.first ==
                                            _game.matchCheck[1].values.first &&
                                        _game.matchCheck[0].keys.first !=
                                            _game.matchCheck[1].keys.first) {
                                      scores += 100;
                                      match++;
                                      isSuccess = true;
                                      _gamePageAudioPlayer.play(
                                          AssetSource('sound/goodflip.mp3'));

                                      context
                                          .read<FlipMessageProvider>()
                                          .setSuccessMessage();
                                      if (match == 3) {
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
                                        isSuccess = false;
                                        context
                                            .read<FlipMessageProvider>()
                                            .setFailureMessage();
                                        _gamePageAudioPlayer.play(
                                            AssetSource('sound/badflip.mp3'));
                                      });
                                      Future.delayed(
                                          const Duration(milliseconds: 500),
                                          () {
                                        setState(() {
                                          _game.gameImg![_game
                                              .matchCheck[0]
                                              .keys
                                              .first] = _game.hiddenCardPath;
                                          _game.gameImg![_game
                                              .matchCheck[1]
                                              .keys
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
