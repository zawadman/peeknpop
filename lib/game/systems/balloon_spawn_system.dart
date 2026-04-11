import 'package:peeknpop/game/components/pivot_component.dart';
import 'package:peeknpop/game/components/balloon_unit_component.dart';

class BalloonSpawnSystem {
  static void spawnLayeredBloomBalloons(PivotComponent pivot) {
    const double maxStringLength = 448;
    const int sectionCount = 4;
    const double sectionLength = maxStringLength / sectionCount;

    final List<BalloonSectionData> sections = [
      BalloonSectionData(
        stringLength: sectionLength * 1,
        balloonCount: 5,
        startAngle: -30,
        endAngle: 30,
        balloonRadius: 16,
      ),
      BalloonSectionData(
        stringLength: sectionLength * 2,
        balloonCount: 7,
        startAngle: -35,
        endAngle: 35,
        balloonRadius: 17,
      ),
      BalloonSectionData(
        stringLength: sectionLength * 3,
        balloonCount: 12,
        startAngle: -55,
        endAngle: 55,
        balloonRadius: 18,
      ),
      BalloonSectionData(
        stringLength: sectionLength * 4,
        balloonCount: 10,
        startAngle: -30,
        endAngle: 30,
        balloonRadius: 18,
      ),
    ];

    // Spawn farthest section first, nearest section last
    for (final section in sections.reversed) {
      _spawnSection(pivot, section);
    }
  }

  static void _spawnSection(PivotComponent pivot, BalloonSectionData section) {
    for (int i = 0; i < section.balloonCount; i++) {
      final double t = section.balloonCount == 1
          ? 0.5
          : i / (section.balloonCount - 1);

      final double angle =
          section.startAngle + (section.endAngle - section.startAngle) * t;

      pivot.add(
        BalloonUnitComponent(
          angleInDegrees: angle,
          stringLength: section.stringLength,
          balloonRadius: section.balloonRadius,
        ),
      );
    }
  }
}

class BalloonSectionData {
  final double stringLength;
  final int balloonCount;
  final double startAngle;
  final double endAngle;
  final double balloonRadius;

  const BalloonSectionData({
    required this.stringLength,
    required this.balloonCount,
    required this.startAngle,
    required this.endAngle,
    required this.balloonRadius,
  });
}
