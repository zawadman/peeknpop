import 'package:flame/components.dart';
import 'package:flame/game.dart';

class BackgroundComponent extends SpriteComponent
    with HasGameReference<FlameGame> {
  @override
  Future<void> onLoad() async {
    await super.onLoad();

    sprite = await game.loadSprite('birthday_bg.png');
    size = game.size;
    position = Vector2.zero();
  }
}
