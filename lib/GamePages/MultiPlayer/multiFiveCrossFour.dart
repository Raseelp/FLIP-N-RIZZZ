import 'package:flipnrizz/util/appColors.dart';
import 'package:flipnrizz/util/gameLogic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../util/msgProvider.dart';

class MultiFivecrossFour extends StatefulWidget {
  final int themeIndex;
  final String playerOne;
  final String playerTwo;
  const MultiFivecrossFour(
      {super.key,
      required this.themeIndex,
      required this.playerOne,
      required this.playerTwo});

  @override
  State<MultiFivecrossFour> createState() => _MultiFivecrossFour();
}

class _MultiFivecrossFour extends State<MultiFivecrossFour> {
  int blueScore = 0; // Score for player 1 (Blue)
  int redScore = 0; // Score for player 2 (Red)
  int tries = 0;
  bool isBlueTurn = true;
  bool isSuccess = false;
  int match = 0;
  bool _isCardFlipping = false;
  String Winner = '';
  // To track elapsed time

  late Game _game;
  @override
  void initState() {
    _game = Game(widget.themeIndex, cardCount: 20);
    super.initState();
    _game.initGame();
    _game.generateImages(20);
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                          onPressed: () {
                            _game.showMultiPauseDialog(context);
                          },
                          icon: Icon(
                            Icons.pause_presentation_sharp,
                            color: Colors.black,
                            size: screenHeight * .05,
                          )),
                      _buildPlayerStatus(
                          widget.playerOne, blueScore, isBlueTurn),
                      _buildPlayerStatus(
                          widget.playerTwo, redScore, !isBlueTurn),
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
                    crossAxisCount: 4,
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
                                  isSuccess = true;
                                  context
                                      .read<FlipMessageProvider>()
                                      .setSuccessMessage();
                                  if (match == 10) {
                                    if (blueScore > redScore) {
                                      Winner = widget.playerOne;
                                    } else {
                                      Winner = widget.playerTwo;
                                    }
                                    _game.showMultiVictoryDiolog(
                                        blueScore,
                                        redScore,
                                        Winner,
                                        context,
                                        widget.playerOne,
                                        widget.playerTwo);
                                  }
                                  _game.matchCheck.clear();
                                } else {
                                  setState(() {
                                    _isCardFlipping = true;
                                    isSuccess = false;
                                    context
                                        .read<FlipMessageProvider>()
                                        .setFailureMessage();
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
      height: MediaQuery.of(context).size.height * 0.13,
      decoration: BoxDecoration(
          color: isActive
              ? (player == widget.playerOne ? Colors.blue : Colors.red)
              : Colors.grey[300],
          borderRadius: BorderRadius.circular(0),
          border: Border.all()),
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
