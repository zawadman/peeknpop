import 'dart:math';
import 'package:flame/components.dart';
import 'string_visual_component.dart';

class BalloonUnitComponent extends PositionComponent {
  final double angleInDegrees;
  final double stringLength;
  final double balloonRadius;
  final double swayAngleDegrees;
  final double swaySpeed;

  double _elapsedTime = 0;
  bool _isPopped = false;

  BalloonUnitComponent({
    required this.angleInDegrees,
    required this.stringLength,
    required this.balloonRadius,
    this.swayAngleDegrees = 6,
    this.swaySpeed = 1.5,
  });

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    position = Vector2.zero();
    size = Vector2.all(1);
    anchor = Anchor.center;

    final string =
        StringVisualComponent(
            stringLength: stringLength,
            balloonRadius: balloonRadius,
          )
          ..position = Vector2.zero()
          ..anchor = Anchor.bottomCenter;

    add(string);
  }

  @override
  void update(double dt) {
    super.update(dt);

    if (_isPopped) return;

    _elapsedTime += dt;

    final baseAngleInRadians = angleInDegrees * pi / 180;
    final swayOffsetInRadians =
        sin(_elapsedTime * swaySpeed) * (swayAngleDegrees * pi / 180);

    angle = baseAngleInRadians + swayOffsetInRadians;
  }

  void pop() {
    if (_isPopped) return;

    _isPopped = true;
    removeFromParent();
  }
}
