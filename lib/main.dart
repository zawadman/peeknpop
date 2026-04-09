import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'game/systems/peeknpop_game.dart';

void main() {
  runApp(const PeeknPopApp());
}

class PeeknPopApp extends StatelessWidget {
  const PeeknPopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GameWidget(game: PeeknPopGame()),
    );
  }
}
