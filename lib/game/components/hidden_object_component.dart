import 'package:flame/components.dart';
import 'package:flame/game.dart';

class HiddenObjectComponent extends SpriteComponent
    with HasGameReference<FlameGame> {
  final String spritePath;
  @override
  final double width;
  @override
  final double height;
  final double xFactor;
  final double yFactor;

  HiddenObjectComponent({
    required this.spritePath,
    required this.width,
    required this.height,
    this.xFactor = 0.5,
    this.yFactor = 0.42,
  });

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    sprite = await game.loadSprite(spritePath);

    size = Vector2(width, height);
    anchor = Anchor.center;

    position = Vector2(game.size.x * xFactor, game.size.y * yFactor);
  }
}
