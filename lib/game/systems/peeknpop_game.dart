import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:peeknpop/game/components/background_component.dart';
import 'package:peeknpop/game/components/hidden_object_component.dart';
import 'package:peeknpop/game/components/pivot_component.dart';
import 'package:peeknpop/game/systems/balloon_spawn_system.dart';

class PeeknPopGame extends FlameGame with TapCallbacks {
  final int rows = 30;
  final int cols = 18;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    // debugMode = true;

    add(BackgroundComponent());

    add(
      HiddenObjectComponent(
        spritePath: 'cake.png',
        width: 220,
        height: 220,
        xFactor: 0.5,
        yFactor: 0.42,
      ),
    );

    final pivot = PivotComponent(row: 26, col: 9, rows: rows, cols: cols);

    add(pivot);

    BalloonSpawnSystem.spawnLayeredBloomBalloons(pivot);
  }
}
