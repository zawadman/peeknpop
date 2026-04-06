import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class PeeknPopGame extends FlameGame {
  final int rows = 30;
  final int cols = 18;

  late double cellWidth;
  late double cellHeight;

  @override
  Future<void> onLoad() async {
    super.onLoad();

    // -----------------------------
    // BACKGROUND
    // -----------------------------
    final background = SpriteComponent()
      ..sprite = await loadSprite('birthday_bg.png')
      ..size = size
      ..position = Vector2.zero();

    add(background);

    // -----------------------------
    // GRID SIZE
    // -----------------------------
    cellWidth = size.x / cols;
    cellHeight = size.y / rows;

    // -----------------------------
    // GRID OVERLAY
    // -----------------------------
    add(GridOverlay(rows: rows, cols: cols));
  }
}

class GridOverlay extends PositionComponent with HasGameReference<FlameGame> {
  final int rows;
  final int cols;

  GridOverlay({required this.rows, required this.cols});

  @override
  Future<void> onLoad() async {
    super.onLoad();

    // THIS WAS MISSING
    size = game.size;
    position = Vector2.zero();
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    final paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 1;

    final cellWidth = size.x / cols;
    final cellHeight = size.y / rows;

    // vertical lines
    for (int c = 0; c <= cols; c++) {
      final x = c * cellWidth;

      canvas.drawLine(Offset(x, 0), Offset(x, size.y), paint);
    }

    // horizontal lines
    for (int r = 0; r <= rows; r++) {
      final y = r * cellHeight;

      canvas.drawLine(Offset(0, y), Offset(size.x, y), paint);
    }
  }
}
