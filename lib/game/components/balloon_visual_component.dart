import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'balloon_unit_component.dart';
import 'string_visual_component.dart';

class BalloonVisualComponent extends SpriteComponent
    with HasGameReference<FlameGame>, TapCallbacks, GestureHitboxes {
  final double radius;
  final String spritePath;

  BalloonVisualComponent({
    required this.radius,
    this.spritePath = 'balloon_green.png',
  });

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    final scaledRadius = radius * 12;

    sprite = await game.loadSprite(spritePath);
    size = Vector2(scaledRadius * 2, scaledRadius * 1.2);
    anchor = Anchor.center;

    final hitbox =
        CircleHitbox(
            radius: size.x * 0.11,
          ) //hardcoded size to match sprite dimensions
          ..anchor = Anchor.center
          ..position = Vector2(size.x / 2, size.y / 2 - 15);

    add(hitbox);
  }

  @override
  void onTapDown(TapDownEvent event) {
    final stringParent = parent;
    if (stringParent is StringVisualComponent) {
      final balloonUnit = stringParent.parent;
      if (balloonUnit is BalloonUnitComponent) {
        balloonUnit.pop();
      }
    }
  }
}
