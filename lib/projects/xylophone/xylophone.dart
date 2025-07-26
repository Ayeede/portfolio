import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({super.key});

  @override
  Widget build(BuildContext context) {
    void playSound(int soundNumber) {
      AudioCache.instance = AudioCache(prefix: '');
      final player = AudioPlayer();
      player.play(AssetSource('xylophone/note$soundNumber.wav'));
    }

    Expanded buildKey({MaterialColor? keyColor, int? soundNumber}) {
      return Expanded(
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: keyColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.zero)),
          ),
          onPressed: () {
            playSound(soundNumber!);
          },
          child: Container(),
        ),
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildKey(keyColor: Colors.red, soundNumber: 1),
              buildKey(keyColor: Colors.orange, soundNumber: 2),
              buildKey(keyColor: Colors.yellow, soundNumber: 3),
              buildKey(keyColor: Colors.green, soundNumber: 4),
              buildKey(keyColor: Colors.teal, soundNumber: 5),
              buildKey(keyColor: Colors.blue, soundNumber: 6),
              buildKey(keyColor: Colors.purple, soundNumber: 7),
            ],
          ),
        ),
      ),
    );
  }
}
