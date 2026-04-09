import 'package:flame/game.dart';
import 'package:flame/events.dart';
import 'package:peeknpop/game/components/background_component.dart';
import 'package:peeknpop/game/components/grid_overlay_component.dart';
import 'package:peeknpop/game/components/pivot_component.dart';
import 'package:peeknpop/game/components/balloon_unit_component.dart';

class PeeknPopGame extends FlameGame with TapCallbacks {
  final int rows = 30;
  final int cols = 18;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    add(BackgroundComponent());
    add(GridOverlayComponent(rows: rows, cols: cols));

    final pivot = PivotComponent(row: 26, col: 9, rows: rows, cols: cols);

    add(pivot);

    // One balloon for now.
    // angleInDegrees = 0 means straight upward.
    const int balloonCount = 10;
    const double startAngle = -50;
    const double endAngle = 45;

    for (int i = 0; i < balloonCount; i++) {
      final double t =
          i / (balloonCount - 1); //interpolation value or spreadof balloons
      final double angle = startAngle + (endAngle - startAngle) * t;

      pivot.add(
        BalloonUnitComponent(
          angleInDegrees: angle,
          stringLength: 220 + (i % 3) * 10, // small variation
          balloonRadius: 16 + (i % 2) * 2, // small variation
        ),
      );
    }
  }
}
