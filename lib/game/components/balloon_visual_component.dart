import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'balloon_unit_component.dart';
import 'string_visual_component.dart';

class BalloonVisualComponent extends SpriteComponent
    with HasGameReference<FlameGame>, TapCallbacks {
  final double radius;
  final String spritePath;

  BalloonVisualComponent({
    required this.radius,
    this.spritePath = 'balloon_green.png',
  });

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    final scaledRadius = radius * 4; //issue with tap because of scale

    sprite = await game.loadSprite(spritePath);
    size = Vector2(
      scaledRadius * 4,
      scaledRadius * 2.4,
    ); //issue with tap because of scale
    anchor = Anchor.center;
  }

  @override
  void onTapDown(TapDownEvent event) {
    if (parent is StringVisualComponent) {
      final stringParent = parent as StringVisualComponent;

      if (stringParent.parent is BalloonUnitComponent) {
        final balloonUnit = stringParent.parent as BalloonUnitComponent;
        balloonUnit.pop();
      }
    }
  }
}
