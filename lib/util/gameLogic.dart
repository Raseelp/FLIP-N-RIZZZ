import 'package:flipnrizz/MultiThemeSelection.dart';
import 'package:flipnrizz/homePage.dart';
import 'package:flipnrizz/themeSelection.dart';
import 'package:flipnrizz/util/appColors.dart';
import 'package:flutter/material.dart';

class Game {
  final String hiddenCardPath = 'assets/images/hidden.png';
  final int cardCount;
  final int themeIndex;
  int _secondsElapsed = 0;
  List<String>? gameImg;
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
      'assets/images/c5.png',
      'assets/images/c7.png',
      'assets/images/c2.png',
      'assets/images/c6.png',
      'assets/images/c3.png',
      'assets/images/c4.png',
      'assets/images/c1.png',
      'assets/images/c8.png',
      'assets/images/c9.png',
      'assets/images/c10.png',
    ]
  ];

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
    stopTimer();
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: Stack(children: [
            AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0)),
              backgroundColor: Colors.white,
              content: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.width * 1.5,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.width * .15,
                      ),
                      const Text(
                        textAlign: TextAlign.center,
                        'Big W energy\, no cap!',
                        style: TextStyle(
                            color: AppColors.primaryText, fontSize: 35),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.30,
                                height: MediaQuery.of(context).size.width * 0.3,
                                decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(0),
                                ),
                                child: Stack(
                                  children: [
                                    Image.asset(
                                      'assets/images/ghost.png',
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.7,
                                      fit: BoxFit.fill,
                                    ),
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
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.30,
                                height: MediaQuery.of(context).size.width * 0.3,
                                decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(0),
                                ),
                                child: Stack(
                                  children: [
                                    Image.asset(
                                      'assets/images/bum.png',
                                    ),
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
                                                  fontWeight: FontWeight.bold),
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
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(0),
                            color: Colors.white,
                          ),
                          child: Stack(children: [
                            Image.asset(
                              'assets/images/aura.png',
                              width: MediaQuery.of(context).size.width * 0.7,
                              fit: BoxFit.fill,
                            ),
                            Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Aurapoints',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30),
                                  ),
                                  Text(
                                    '+ $scores',
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 40,
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
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ThemeSelection()));
                              },
                              child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.30,
                                  height:
                                      MediaQuery.of(context).size.width * 0.25,
                                  decoration: BoxDecoration(
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(0),
                                  ),
                                  child: Stack(children: [
                                    Image.asset(
                                      'assets/images/sa.png',
                                      fit: BoxFit.fill,
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.25,
                                    ),
                                    const Positioned(
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
                                    builder: (context) => Homepage(),
                                  ),
                                );
                              },
                              child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.30,
                                  height:
                                      MediaQuery.of(context).size.width * 0.25,
                                  decoration: BoxDecoration(
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(0),
                                  ),
                                  child: Stack(children: [
                                    Image.asset(
                                      'assets/images/untiledited.png',
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.25,
                                      fit: BoxFit.fill,
                                    ),
                                    const Positioned(
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

  void showMultiVictoryDiolog(
      int bluescores, int redScores, String Winner, BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: AlertDialog(
            backgroundColor: AppColors.pastelYellow,
            content: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.4,
              child: Column(
                children: [
                  Text(
                    '$Winner WINS!',
                    style:
                        TextStyle(color: AppColors.primaryText, fontSize: 35),
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
                        width: 100,
                        height: 150,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: double.infinity,
                              color: AppColors.cardBack,
                              child: const Center(
                                child: Text(
                                  'Blue',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Text(
                              '$bluescores',
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
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
                        width: 100,
                        height: 150,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: double.infinity,
                              color: AppColors.primaryAccent,
                              child: const Center(
                                child: Text(
                                  'Red',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Text(
                              '$redScores',
                              style: TextStyle(
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
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.primaryAccent),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Multithemeselection()));
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.15,
                            height: MediaQuery.of(context).size.width * 0.15,
                            decoration: BoxDecoration(
                              border: Border.all(),
                              color: AppColors.lightCyan,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Icon(
                              Icons.restart_alt_rounded,
                              size: 40,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Homepage(),
                              ),
                            );
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.15,
                            height: MediaQuery.of(context).size.width * 0.15,
                            decoration: BoxDecoration(
                              border: Border.all(),
                              color: AppColors.lightCyan,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Icon(
                              Icons.home_outlined,
                              size: 40,
                            ),
                          ),
                        )
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
              side: BorderSide(width: 2)),
          backgroundColor: Colors.white,
          content: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.width * 1.1,
            child: Column(
              children: [
                const Text(
                  'Hold Up',
                  style: TextStyle(color: AppColors.primaryText, fontSize: 35),
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
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(0),
                            ),
                            child: Stack(children: [
                              Image.asset('assets/images/bum.png'),
                              const Positioned(
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
                                      builder: (context) => ThemeSelection()));
                            },
                            child: Container(
                                width: MediaQuery.of(context).size.width * 0.25,
                                height:
                                    MediaQuery.of(context).size.width * 0.19,
                                decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(0),
                                ),
                                child: Stack(children: [
                                  Image.asset(
                                    'assets/images/sa.png',
                                  ),
                                  const Positioned(
                                    child: Center(
                                      child: Text(
                                        'Restart',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 18),
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
                                  builder: (context) => Homepage(),
                                ),
                              );
                            },
                            child: Container(
                                width: MediaQuery.of(context).size.width * 0.25,
                                height:
                                    MediaQuery.of(context).size.width * 0.19,
                                decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(0),
                                ),
                                child: Stack(children: [
                                  Image.asset(
                                    'assets/images/untiledited.png',
                                  ),
                                  const Positioned(
                                    child: Center(
                                      child: Text(
                                        'Dip NOW',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 18),
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
              side: BorderSide(width: 2)),
          backgroundColor: Colors.white,
          content: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.width * 1.1,
            child: Column(
              children: [
                const Text(
                  'HOLD UP',
                  style: TextStyle(color: AppColors.primaryText, fontSize: 35),
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
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(0),
                            ),
                            child: Stack(children: [
                              Image.asset('assets/images/bum.png'),
                              const Positioned(
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
                                  builder: (context) => Multithemeselection(),
                                ),
                              );
                            },
                            child: Container(
                                width: MediaQuery.of(context).size.width * 0.25,
                                height:
                                    MediaQuery.of(context).size.width * 0.19,
                                decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(0),
                                ),
                                child: Stack(children: [
                                  Image.asset(
                                    'assets/images/sa.png',
                                  ),
                                  const Positioned(
                                    child: Center(
                                      child: Text(
                                        'Restart',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 18),
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
                                  builder: (context) => Homepage(),
                                ),
                              );
                            },
                            child: Container(
                                width: MediaQuery.of(context).size.width * 0.25,
                                height:
                                    MediaQuery.of(context).size.width * 0.19,
                                decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(0),
                                ),
                                child: Stack(children: [
                                  Image.asset(
                                    'assets/images/untiledited.png',
                                  ),
                                  const Positioned(
                                    child: Center(
                                      child: Text(
                                        'Dip NOW',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 18),
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
        );
      },
    );
  }
}
