import 'package:flame/game.dart';
import 'package:peeknpop/game/components/background_component.dart';
import 'package:peeknpop/game/components/grid_overlay_component.dart';
import 'package:peeknpop/game/components/pivot_component.dart';

class PeeknPopGame extends FlameGame {
  final int rows = 30;
  final int cols = 18;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    add(BackgroundComponent());
    add(GridOverlayComponent(rows: rows, cols: cols));
    add(PivotComponent(row: 26, col: 9, rows: rows, cols: cols));
  }
}
