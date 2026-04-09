import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/text.dart';
import 'package:flutter/material.dart';

class GridOverlayComponent extends PositionComponent
    with HasGameReference<FlameGame> {
  final int rows;
  final int cols;

  late final TextPaint coordinateTextPaint;

  GridOverlayComponent({required this.rows, required this.cols});

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    size = game.size;
    position = Vector2.zero();

    coordinateTextPaint = TextPaint(
      style: const TextStyle(
        color: Colors.white,
        fontSize: 8,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    final gridPaint = Paint()
      ..color = Colors.red
      ..strokeWidth = 1;

    final cellWidth = size.x / cols;
    final cellHeight = size.y / rows;

    // Draw vertical grid lines
    for (int c = 0; c <= cols; c++) {
      final x = c * cellWidth;
      canvas.drawLine(Offset(x, 0), Offset(x, size.y), gridPaint);
    }

    // Draw horizontal grid lines
    for (int r = 0; r <= rows; r++) {
      final y = r * cellHeight;
      canvas.drawLine(Offset(0, y), Offset(size.x, y), gridPaint);
    }

    // Draw coordinate labels at intersections
    // for (int r = 0; r <= rows; r++) {
    //   for (int c = 0; c <= cols; c++) {
    //     final x = c * cellWidth;
    //     final y = r * cellHeight;

    //     coordinateTextPaint.render(canvas, '($r,$c)', Vector2(x + 2, y + 2));
    //   }
    // }
  }
}
