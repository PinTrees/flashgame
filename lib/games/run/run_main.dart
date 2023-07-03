
import 'package:flame/game.dart';
import 'package:flashgame/games/run/run_gameloop.dart';
import 'package:flutter/material.dart';

class RunGamePage extends StatefulWidget {
  const RunGamePage({super.key, required this.title});
  final String title;

  @override
  State<RunGamePage> createState() => _RunGamePageState();
}
class _RunGamePageState extends State<RunGamePage> {
  RunGame game = RunGame();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
        body: Stack(
          children: [
            // TODO 1
            GameWidget(game: game),

            /*Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Joypad(onDirectionChanged: onJoypadDirectionChanged),
              ),
            )*/
          ],
        )
    );
  }
}