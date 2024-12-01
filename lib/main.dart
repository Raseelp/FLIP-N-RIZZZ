import 'package:audioplayers/audioplayers.dart';
import 'package:flipnrizz/loadingPage.dart';
import 'package:flipnrizz/util/msgProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const FlipNRizz());
}

class FlipNRizz extends StatefulWidget {
  const FlipNRizz({super.key});

  @override
  State<FlipNRizz> createState() => _FlipNRizzState();
}

class _FlipNRizzState extends State<FlipNRizz> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  void backgroundMusicPlay() {
    _audioPlayer.setReleaseMode(ReleaseMode.loop);
    _audioPlayer.setVolume(0.6); // This will make the audio loop
    _audioPlayer.play(AssetSource('sound/bg.mp3'));
  }

  @override
  void initState() {
    super.initState();
    backgroundMusicPlay();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FlipMessageProvider(),
      child: MaterialApp(
        theme: ThemeData(
          textTheme: const TextTheme(
            bodyMedium: TextStyle(fontFamily: 'bangers', letterSpacing: 2),
          ),
        ),
        home: const LoadingPage(),
      ),
    );
  }
}
