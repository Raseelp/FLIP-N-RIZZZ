import 'package:audioplayers/audioplayers.dart';
import 'package:confetti/confetti.dart';
import 'package:flipnrizz/GamePages/MultiPlayer/charactorSelectio.dart';
import 'package:flipnrizz/MultiThemeSelection.dart';
import 'package:flipnrizz/homePage.dart';
import 'package:flipnrizz/themeSelection.dart';
import 'package:flipnrizz/util/appColors.dart';
import 'package:flutter/material.dart';

class Game {
  final String hiddenCardPath = 'assets/images/hidden.png';
  final int cardCount;
  final int themeIndex;
  final int _secondsElapsed = 0;
  List<String>? gameImg;
  final AudioPlayer _victoryAudioPlayer = AudioPlayer();

  final List<List<String>> themes = [
    [
      'assets/images/1.png',
      'assets/images/2.png',
      'assets/images/3.png',
      'assets/images/4.png',
      'assets/images/5.png',
      'assets/images/6.png',
      'assets/images/7.png',
      'assets/images/8.png',
      'assets/images/9.png',
      'assets/images/10.png',
    ],
    [
      'assets/images/c1.png',
      'assets/images/c3.png',
      'assets/images/bum.png',
      'assets/images/c6.png',
      'assets/images/c5.png',
      'assets/images/c4.png',
      'assets/images/c7.png',
      'assets/images/c8.png',
      'assets/images/c9.png',
      'assets/images/c10.png',
    ],
    [
      'assets/images/r1.png',
      'assets/images/r3.png',
      'assets/images/r2.png',
      'assets/images/r4.png',
      'assets/images/r5.png',
      'assets/images/r6.png',
      'assets/images/r7.png',
      'assets/images/r8.png',
      'assets/images/r9.png',
      'assets/images/r10.png',
    ],
  ];

  final List<String> winningMsg = [
    'Skibidi sigma mogged it!',
    'You lit, Don Pollo approves!',
    'Pure sigma grindset vibes!',
    'Skibidi-dub-dub, you mogged!',
    'Mogged the game, stayed sigma!',
  ];
  String genarateSingleWinMsg() {
    winningMsg.shuffle();
    return winningMsg[0];
  }

  final List<String> winningMultiMsg = [
    ' mogged!',
    ' giga don!',
    ' rizzlord!',
    ' too chad to lose!',
    ' don polo’d it!',
    ' mogged it!',
    ' Skibidi King!'
  ];
  String genarateMultiWinMsg() {
    winningMultiMsg.shuffle();
    return winningMultiMsg[0];
  }

  List<String> cardsList = [];

  void generateImages(int gridSize) {
    int uniqueImageCount = gridSize ~/ 2;
    final List<String> selectedImages =
        themes[themeIndex].sublist(0, uniqueImageCount);
    cardsList = [...selectedImages, ...selectedImages];
    cardsList.shuffle();
  }

  List<Map<int, String>> matchCheck = [];

  Game(this.themeIndex, {required this.cardCount});

  void initGame() {
    gameImg = List.generate(
      cardCount,
      (index) => hiddenCardPath,
    );
  }

  void showVictoryDiolog(int moves, int scores, Function stopTimer,
      BuildContext context, String time) {
    final ConfettiController confettiController =
        ConfettiController(duration: const Duration(seconds: 5));
    stopTimer();
    _victoryAudioPlayer.setReleaseMode(ReleaseMode.loop);
    _victoryAudioPlayer.setVolume(0.5);
    _victoryAudioPlayer.play(AssetSource('sound/skibidi.mp3'));

    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        confettiController.play();
        return WillPopScope(
          onWillPop: () async {
            _victoryAudioPlayer.stop();
            return false;
          },
          child: Stack(children: [
            AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0)),
              backgroundColor: AppColors.pastelYellow,
              content: Stack(children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.width * 1.5,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.width * .15,
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          genarateSingleWinMsg(),
                          style: const TextStyle(
                              color: AppColors.primaryText, fontSize: 35),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.30,
                                  height:
                                      MediaQuery.of(context).size.width * 0.3,
                                  decoration: BoxDecoration(
                                    image: const DecorationImage(
                                        image: AssetImage(
                                            'assets/images/ghost.gif'),
                                        fit: BoxFit.cover),
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(0),
                                  ),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        child: Center(
                                          child: Column(
                                            children: [
                                              const Text(
                                                'Brainflips:',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 24),
                                              ),
                                              Text(
                                                ' $moves',
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 24,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.30,
                                  height:
                                      MediaQuery.of(context).size.width * 0.3,
                                  decoration: BoxDecoration(
                                    image: const DecorationImage(
                                        image:
                                            AssetImage('assets/images/bum.gif'),
                                        fit: BoxFit.cover),
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(0),
                                  ),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        child: Center(
                                          child: Column(
                                            children: [
                                              const Text(
                                                'ticktock:',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 24),
                                              ),
                                              Text(
                                                ' $time',
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 24,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            height: MediaQuery.of(context).size.width * 0.4,
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                  image: AssetImage('assets/images/aura1.gif'),
                                  fit: BoxFit.cover),
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(0),
                              color: Colors.white,
                            ),
                            child: Stack(children: [
                              Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Aurapoints',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 35),
                                    ),
                                    Text(
                                      '+ $scores',
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 45,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          height: MediaQuery.of(context).size.width * 0.3,
                          decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(0),
                              color: Colors.white),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  _victoryAudioPlayer.stop();
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const ThemeSelection()));
                                },
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.30,
                                  height:
                                      MediaQuery.of(context).size.width * 0.25,
                                  decoration: BoxDecoration(
                                    image: const DecorationImage(
                                        image: AssetImage(
                                            'assets/images/gtasa.gif'),
                                        fit: BoxFit.cover),
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(0),
                                  ),
                                  child: const Stack(
                                    children: [
                                      Positioned(
                                        child: Center(
                                          child: Text(
                                            'Restart',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  _victoryAudioPlayer.stop();
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Homepage(),
                                    ),
                                  );
                                },
                                child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.30,
                                    height: MediaQuery.of(context).size.width *
                                        0.25,
                                    decoration: BoxDecoration(
                                      image: const DecorationImage(
                                          image: AssetImage(
                                              'assets/images/until.gif'),
                                          fit: BoxFit.cover),
                                      border: Border.all(),
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                    child: const Stack(children: [
                                      Positioned(
                                        child: Center(
                                          child: Text(
                                            'Dip NOW',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18),
                                          ),
                                        ),
                                      )
                                    ])),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: MediaQuery.of(context).size.width * 0.05,
                  child: ConfettiWidget(
                    confettiController: confettiController,
                    blastDirectionality:
                        BlastDirectionality.explosive, // Can be directional
                    shouldLoop: true,
                    blastDirection: 3.14, // Angle of the confetti
                    maxBlastForce: 5, // Max force of confetti particles
                    minBlastForce: 2, // Min force of confetti particles
                    numberOfParticles: 50, // Number of confetti particles
                  ),
                ),
                Positioned(
                  right: MediaQuery.of(context).size.width * 0.05,
                  child: ConfettiWidget(
                    confettiController: confettiController,
                    blastDirectionality:
                        BlastDirectionality.explosive, // Can be directional
                    shouldLoop: true,
                    blastDirection: 3.14, // Angle of the confetti
                    maxBlastForce: 5, // Max force of confetti particles
                    minBlastForce: 2, // Min force of confetti particles
                    numberOfParticles: 50, // Number of confetti particles
                  ),
                ),
              ]),
            ),
            Positioned(
                top: MediaQuery.of(context).size.width * -0.03,
                left: MediaQuery.of(context).size.width * 0.25,
                child: Image.asset(
                  'assets/images/donbg.png',
                  width: MediaQuery.of(context).size.width * 0.5,
                ))
          ]),
        );
      },
    );
  }

  void showMultiVictoryDiolog(int bluescores, int redScores, String Winner,
      BuildContext context, String playerOne, String playerTwo) {
    final ConfettiController multiConfettiController =
        ConfettiController(duration: const Duration(seconds: 5));
    _victoryAudioPlayer.setReleaseMode(ReleaseMode.loop);
    _victoryAudioPlayer.setVolume(0.5);
    _victoryAudioPlayer.play(AssetSource('sound/skibidi.mp3'));
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        multiConfettiController.play();
        return WillPopScope(
          onWillPop: () async {
            _victoryAudioPlayer.stop();
            return false;
          },
          child: Stack(children: [
            AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                  side: const BorderSide(width: 1)),
              backgroundColor: AppColors.pastelYellow,
              content: Stack(children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.width * .15,
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          '$Winner${genarateMultiWinMsg()}',
                          style: const TextStyle(
                              color: AppColors.primaryText, fontSize: 35),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.blue,
                              ),
                              width: MediaQuery.of(context).size.width * 0.3,
                              height: MediaQuery.of(context).size.height * 0.22,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    color: AppColors.cardBack,
                                    child: Center(
                                      child: Text(
                                        playerOne,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '$bluescores',
                                    style: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        fontSize: 70,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.red,
                              ),
                              width: MediaQuery.of(context).size.width * 0.3,
                              height: MediaQuery.of(context).size.height * 0.22,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    color: AppColors.primaryAccent,
                                    child: Center(
                                      child: Text(
                                        playerTwo,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '$redScores',
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 70,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          height: MediaQuery.of(context).size.width * 0.3,
                          decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(0),
                              color: Colors.white),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  _victoryAudioPlayer.stop();
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Multithemeselection(
                                                playerOne: playerOne,
                                                playerTwo: playerTwo,
                                              )));
                                },
                                child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.30,
                                    height: MediaQuery.of(context).size.width *
                                        0.25,
                                    decoration: BoxDecoration(
                                      image: const DecorationImage(
                                          image: AssetImage(
                                              'assets/images/gtasa.gif'),
                                          fit: BoxFit.cover),
                                      border: Border.all(),
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                    child: const Stack(children: [
                                      Positioned(
                                        child: Center(
                                          child: Text(
                                            'Restart',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18),
                                          ),
                                        ),
                                      )
                                    ])),
                              ),
                              GestureDetector(
                                onTap: () {
                                  _victoryAudioPlayer.stop();
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Homepage(),
                                    ),
                                  );
                                },
                                child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.30,
                                    height: MediaQuery.of(context).size.width *
                                        0.25,
                                    decoration: BoxDecoration(
                                      image: const DecorationImage(
                                          image: AssetImage(
                                              'assets/images/until.gif'),
                                          fit: BoxFit.cover),
                                      border: Border.all(),
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                    child: const Stack(children: [
                                      Positioned(
                                        child: Center(
                                          child: Text(
                                            'Dip NOW',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18),
                                          ),
                                        ),
                                      )
                                    ])),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: MediaQuery.of(context).size.width * 0.05,
                  child: ConfettiWidget(
                    confettiController: multiConfettiController,
                    blastDirectionality:
                        BlastDirectionality.explosive, // Can be directional
                    shouldLoop: true,
                    blastDirection: 3.14, // Angle of the confetti
                    maxBlastForce: 5, // Max force of confetti particles
                    minBlastForce: 2, // Min force of confetti particles
                    numberOfParticles: 50, // Number of confetti particles
                  ),
                ),
                Positioned(
                  right: MediaQuery.of(context).size.width * 0.05,
                  child: ConfettiWidget(
                    confettiController: multiConfettiController,
                    blastDirectionality:
                        BlastDirectionality.explosive, // Can be directional
                    shouldLoop: true,
                    blastDirection: 3.14, // Angle of the confetti
                    maxBlastForce: 5, // Max force of confetti particles
                    minBlastForce: 2, // Min force of confetti particles
                    numberOfParticles: 50, // Number of confetti particles
                  ),
                ),
              ]),
            ),
            Positioned(
                top: MediaQuery.of(context).size.width * 0.03,
                left: MediaQuery.of(context).size.width * 0.25,
                child: Image.asset(
                  'assets/images/donbg.png',
                  width: MediaQuery.of(context).size.width * 0.5,
                ))
          ]),
        );
      },
    );
  }

  void showPauseDialog(
      BuildContext context, Function stopTimer, Function startOrContinueTimer) {
    stopTimer();
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
              side: const BorderSide(width: 2)),
          backgroundColor: AppColors.pastelYellow,
          content: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.width * 1.1,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Text(
                    'Hold Up',
                    style:
                        TextStyle(color: AppColors.primaryText, fontSize: 35),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.05,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(0),
                        color: Colors.white),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            startOrContinueTimer();
                            Navigator.pop(context);
                          },
                          child: Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              height: MediaQuery.of(context).size.width * 0.5,
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                    image: AssetImage('assets/images/bum.gif'),
                                    fit: BoxFit.cover),
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(0),
                              ),
                              child: const Stack(children: [
                                Positioned(
                                  child: Center(
                                    child: Text(
                                      'Continue',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 25),
                                    ),
                                  ),
                                )
                              ])),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.width * 0.09,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ThemeSelection()));
                              },
                              child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                  height:
                                      MediaQuery.of(context).size.width * 0.19,
                                  decoration: BoxDecoration(
                                    image: const DecorationImage(
                                        image: AssetImage(
                                            'assets/images/gtasa.gif'),
                                        fit: BoxFit.cover),
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(0),
                                  ),
                                  child: const Stack(children: [
                                    Positioned(
                                      child: Center(
                                        child: Text(
                                          'Restart',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18),
                                        ),
                                      ),
                                    )
                                  ])),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Homepage(),
                                  ),
                                );
                              },
                              child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                  height:
                                      MediaQuery.of(context).size.width * 0.19,
                                  decoration: BoxDecoration(
                                    image: const DecorationImage(
                                        image: AssetImage(
                                            'assets/images/until.gif'),
                                        fit: BoxFit.cover),
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(0),
                                  ),
                                  child: const Stack(children: [
                                    Positioned(
                                      child: Center(
                                        child: Text(
                                          'Dip NOW',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18),
                                        ),
                                      ),
                                    )
                                  ])),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void showMultiPauseDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
              side: const BorderSide(width: 2)),
          backgroundColor: AppColors.pastelYellow,
          content: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.width * 1.1,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Text(
                    'HOLD UP',
                    style:
                        TextStyle(color: AppColors.primaryText, fontSize: 35),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.05,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(0),
                    ),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              height: MediaQuery.of(context).size.width * 0.5,
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                    image: AssetImage('assets/images/bum.gif'),
                                    fit: BoxFit.cover),
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(0),
                              ),
                              child: const Stack(children: [
                                Positioned(
                                  child: Center(
                                    child: Text(
                                      'Continue',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 25),
                                    ),
                                  ),
                                )
                              ])),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.width * 0.09,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const CharactorSelect(),
                                  ),
                                );
                              },
                              child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                  height:
                                      MediaQuery.of(context).size.width * 0.19,
                                  decoration: BoxDecoration(
                                    image: const DecorationImage(
                                        image: AssetImage(
                                          'assets/images/gtasa.gif',
                                        ),
                                        fit: BoxFit.cover),
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(0),
                                  ),
                                  child: const Stack(children: [
                                    Positioned(
                                      child: Center(
                                        child: Text(
                                          'Restart',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18),
                                        ),
                                      ),
                                    )
                                  ])),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Homepage(),
                                  ),
                                );
                              },
                              child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                  height:
                                      MediaQuery.of(context).size.width * 0.19,
                                  decoration: BoxDecoration(
                                    image: const DecorationImage(
                                        image: AssetImage(
                                            'assets/images/until.gif'),
                                        fit: BoxFit.cover),
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(0),
                                  ),
                                  child: const Stack(children: [
                                    Positioned(
                                      child: Center(
                                        child: Text(
                                          'Dip NOW',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18),
                                        ),
                                      ),
                                    )
                                  ])),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
