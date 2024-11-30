import 'package:flutter/material.dart';

class FlipMessageProvider with ChangeNotifier {
  String _message = "Let's get started!";

  String get message => _message;
  final List<String> success = [
    'Mogged the deck! Absolute Don Pollo vibes.',
    'Skibidi-flip lit! You’re the real Sigma out here.',
    'Rizz overload! You just giga-chadded this round.',
    'Skibidi-bop-bop-banger! Keep the streak alive.',
    'Flawless! The memes salute your Sigma grindset.',
  ];
  final List<String> fail = [
    'Don Pollo disapproves... Skibidi-flop moment!',
    'Yikes, no rizz detected. Better luck next flip!',
    'Mogged by the cards! That wasn’t very Sigma.',
    'Bruh, did you even skibidi-bop before this?',
    'Sigma fail! The cards are roasting you.',
  ];

  void setSuccessMessage() {
    success.shuffle();
    _message = success[0];
    notifyListeners();
  }

  void setFailureMessage() {
    fail.shuffle();
    _message = fail[0];
    notifyListeners();
  }
}
