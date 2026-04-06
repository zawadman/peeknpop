import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class PeeknPopGame extends FlameGame {
  // number of grid rows (vertical)
  final int rows = 10;

  // number of grid columns (horizontal)
  final int cols = 6;

  // size of each grid cell
  late double cellWidth;
  late double cellHeight;

  @override
  Future<void> onLoad() async {
    super.onLoad();

    // -------------------------------------------------
    // 1. LOAD BACKGROUND IMAGE
    // -------------------------------------------------
    final background = SpriteComponent()
      ..sprite = await loadSprite('birthday_bg.png')
      ..size = size
      ..position = Vector2.zero();

    add(background);

    // -------------------------------------------------
    // 2. CALCULATE GRID CELL SIZE BASED ON SCREEN SIZE
    // -------------------------------------------------
    cellWidth = size.x / cols;
    cellHeight = size.y / rows;

    // -------------------------------------------------
    // 3. DRAW DEBUG GRID (red dots)
    // -------------------------------------------------
    _createDebugGrid();
  }

  void _createDebugGrid() {
    //final random = Random();

    // loop through rows
    for (int r = 0; r < rows; r++) {
      // loop through columns
      for (int c = 0; c < cols; c++) {
        // -------------------------------------------------
        // CALCULATE CENTER POSITION OF EACH GRID CELL
        // -------------------------------------------------
        final x = c * cellWidth + cellWidth / 2;
        final y = r * cellHeight + cellHeight / 2;

        // -------------------------------------------------
        // DRAW DEBUG DOT
        // this shows where balloons will spawn
        // -------------------------------------------------
        add(
          CircleComponent(
            radius: 4,
            position: Vector2(x, y),
            anchor: Anchor.center,
            paint: Paint()..color = Colors.red,
          ),
        );
      }
    }
  }
}
