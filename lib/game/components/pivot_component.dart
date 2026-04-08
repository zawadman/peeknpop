import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class PivotComponent extends PositionComponent
    with HasGameReference<FlameGame> {
  final int row;
  final int col;
  final int rows;
  final int cols;

  PivotComponent({
    required this.row,
    required this.col,
    required this.rows,
    required this.cols,
  });

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    final cellWidth = game.size.x / cols;
    final cellHeight = game.size.y / rows;

    position = Vector2(col * cellWidth, row * cellHeight);

    size = Vector2.all(12);
    anchor = Anchor.center;
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    final pivotPaint = Paint()..color = Colors.yellow;

    canvas.drawCircle(Offset(size.x / 2, size.y / 2), 6, pivotPaint);
  }
}
