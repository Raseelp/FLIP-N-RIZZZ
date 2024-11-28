import 'package:flipnrizz/homePage.dart';
import 'package:flipnrizz/util/appColors.dart';
import 'package:flipnrizz/util/gameLogic.dart';
import 'package:flutter/material.dart';

class MultiThreeCrossTwo extends StatefulWidget {
  final int themeIndex;
  const MultiThreeCrossTwo({super.key, required this.themeIndex});

  @override
  State<MultiThreeCrossTwo> createState() => _MultiThreeCrossTwoState();
}

class _MultiThreeCrossTwoState extends State<MultiThreeCrossTwo> {
  int blueScore = 0; // Score for player 1 (Blue)
  int redScore = 0; // Score for player 2 (Red)
  int tries = 0;
  bool isBlueTurn = true;
  bool _isCardFlipping = false;
  int match = 0;
  String Winner = '';
  // To track elapsed time

  late Game _game;
  @override
  void initState() {
    _game = Game(widget.themeIndex, cardCount: 6);
    super.initState();
    _game.initGame();
    _game.generateImages(6);
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
              height: screenHeight * 0.17,
              decoration: const BoxDecoration(
                color: AppColors.secondaryAccent,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(20),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: () {
                        _game.showMultiPauseDialog(context);
                      },
                      icon: Icon(
                        Icons.pause_circle_filled_outlined,
                        color: AppColors.primaryAccent,
                        size: screenHeight * .07,
                      )),
                  _buildPlayerStatus('Blue', blueScore, isBlueTurn),
                  _buildPlayerStatus('Red', redScore, !isBlueTurn),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(screenHeight * 0.02),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 30,
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
                                  if (isBlueTurn) {
                                    blueScore += 1;
                                  } else {
                                    redScore += 1;
                                  }
                                  match++;
                                  if (match == 3) {
                                    if (blueScore > redScore) {
                                      Winner = 'BLUE';
                                    } else {
                                      Winner = 'RED';
                                    }
                                    _game.showMultiVictoryDiolog(
                                        blueScore, redScore, Winner, context);
                                  }
                                  _game.matchCheck.clear();
                                } else {
                                  setState(() {
                                    _isCardFlipping =
                                        true; // Prevent further taps
                                  });
                                  Future.delayed(
                                      const Duration(milliseconds: 500), () {
                                    setState(() {
                                      _game.gameImg![_game.matchCheck[0].keys
                                          .first] = _game.hiddenCardPath;
                                      _game.gameImg![_game.matchCheck[1].keys
                                          .first] = _game.hiddenCardPath;
                                      _game.matchCheck.clear();
                                      isBlueTurn = !isBlueTurn;
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

  Widget _buildPlayerStatus(String player, int score, bool isActive) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.3,
      height: MediaQuery.of(context).size.height * 0.05,
      decoration: BoxDecoration(
        color: isActive
            ? (player == 'Blue' ? Colors.blue : Colors.red)
            : Colors.grey[300],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Text(
          '$player: $score',
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
        ),
      ),
    );
  }
}
