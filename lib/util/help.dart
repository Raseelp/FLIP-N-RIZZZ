import 'package:flutter/material.dart';

class Help {
  void homeHelp(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Stack(children: [
          AlertDialog(
            backgroundColor: Colors.black.withOpacity(0.5),
            content: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.width * 1.7,
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.width * .25,
                  ),
                  const Text(
                    'Haha,You Came',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * .03,
                  ),
                  const Text(
                    'so we both know why you are here,couse you are old,sad and alone. c\'omon dont be sad i was just joking',
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * .05,
                  ),
                  const Text(
                    'Flip N Rizz is a chaotic card-matching game packed with meme madness! Test your memory, out-rizz your friends, and embrace the brainrot themes of Ohio, Skibidi Toilet, and Rizz. Flip, match, and mog to victory! ',
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * .07,
                  ),
                  const Text(
                    'Solo skibidi==> Single player',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'rizz duel==>multiplayer',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * .03,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Got it',
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'bangers',
                            color: Colors.white),
                      ))
                ],
              ),
            ),
          ),
          Positioned(
              left: MediaQuery.of(context).size.width * 0.2,
              child: Image.asset(
                'assets/images/untilbg.png',
                width: MediaQuery.of(context).size.width * 0.6,
              ))
        ]);
      },
    );
  }

  void vibeSelectHelp(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Stack(children: [
          AlertDialog(
            backgroundColor: Colors.black.withOpacity(0.5),
            content: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.width * 1.7,
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.width * .25,
                  ),
                  const Text(
                    'You again?',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * .03,
                  ),
                  const Text(
                    'So in here you can select what kind of card you wanna select, ',
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * .05,
                  ),
                  const Text(
                    'you can select from the three options,',
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * .07,
                  ),
                  const Text(
                    'Ohio Unleashed: Pure chaos with iconic Ohio memes.',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * .03,
                  ),
                  const Text(
                    'Skibidi Blast: Skibidi Toilet madness in card form.',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * .03,
                  ),
                  const Text(
                    'Rizz Rush: Rizzlords and Gigachads dominate.',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * .03,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Got it',
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'bangers',
                            color: Colors.white),
                      ))
                ],
              ),
            ),
          ),
          Positioned(
              left: MediaQuery.of(context).size.width * 0.2,
              child: Image.asset(
                'assets/images/untilbg.png',
                width: MediaQuery.of(context).size.width * 0.6,
              ))
        ]);
      },
    );
  }

  void difficultySelecttHelp(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Stack(children: [
          AlertDialog(
            backgroundColor: Colors.black.withOpacity(0.5),
            content: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.width * 1.7,
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.width * .25,
                  ),
                  const Text(
                    'hey, Internet Grandpa',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * .03,
                  ),
                  const Text(
                    'You can chose how much you should rot your brain',
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * .05,
                  ),
                  const Text(
                    'you have three options,but let me be honest,this is ohio so,you never know what to expect',
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * .07,
                  ),
                  const Text(
                    '1.ohio mode:mild=>            3x2 grid',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * .03,
                  ),
                  const Text(
                    '2.ohio mode:peak chaos=> 4x2 grid',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * .03,
                  ),
                  const Text(
                    '3.ohio mode:absolute rizz=> 5x4 grid',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * .03,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Got it',
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'bangers',
                            color: Colors.white),
                      ))
                ],
              ),
            ),
          ),
          Positioned(
              left: MediaQuery.of(context).size.width * 0.2,
              child: Image.asset(
                'assets/images/untilbg.png',
                width: MediaQuery.of(context).size.width * 0.6,
              ))
        ]);
      },
    );
  }

  void characterSelectHelp(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Stack(children: [
          AlertDialog(
            backgroundColor: Colors.black.withOpacity(0.5),
            content: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.width * 1.7,
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.width * .25,
                  ),
                  const Text(
                    'Reallyy...',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * .03,
                  ),
                  const Text(
                    'You really want help on this,cmon iam really dissappointed',
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * .05,
                  ),
                  const Text(
                    'iam sorry,you poor boomer brain\'s, probabbly trying to figure out what tf is a sigma,no?',
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * .07,
                  ),
                  const Text(
                    'SO HERE YOU CAN NAME YOUR CHARACTER',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * .03,
                  ),
                  const Text(
                    'YOU CAN DO IT BY CLICKING ON THE PLACEHOLDER NAMES',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * .03,
                  ),
                  const Text(
                    'SO YEAH HAVE FUN WITH YOU BOOMER FRIEND',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * .03,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Got it,JEEZ',
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'bangers',
                            color: Colors.white),
                      ))
                ],
              ),
            ),
          ),
          Positioned(
              left: MediaQuery.of(context).size.width * 0.2,
              child: Image.asset(
                'assets/images/untilbg.png',
                width: MediaQuery.of(context).size.width * 0.6,
              ))
        ]);
      },
    );
  }
}
