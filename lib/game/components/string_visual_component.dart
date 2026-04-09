import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'balloon_visual_component.dart';

class StringVisualComponent extends PositionComponent {
  final double stringLength;
  final double balloonRadius;
  final Color balloonColor;

  StringVisualComponent({
    required this.stringLength,
    required this.balloonRadius,
    this.balloonColor = Colors.red,
  });

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    size = Vector2(2, stringLength);
    anchor = Anchor.bottomCenter;

    final balloon = BalloonVisualComponent(radius: balloonRadius)
      ..position = Vector2(size.x / 2 + 7, 0)
      ..anchor = Anchor.bottomCenter;

    add(balloon);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);

    final stringPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2;

    final x = size.x / 2;

    final start = Offset(x + 7, size.y);
    final end = Offset(x + 17, 0);

    canvas.drawLine(start, end, stringPaint);
  }
}
