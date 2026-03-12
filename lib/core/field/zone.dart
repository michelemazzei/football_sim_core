import 'package:flame/game.dart';
import 'package:football_sim_core/ai/config/soccer_parameters.dart';
import 'package:football_sim_core/core/field/field_grid.dart';
import 'package:football_sim_core/core/field/zone_tag.dart';
import 'package:football_sim_core/core/field/zone_types.dart';

class Zone {
  final double x;
  final double y;
  final ZoneType type;
  final double weight;
  final List<ZoneTag> tags;

  const Zone({
    required this.x,
    required this.y,
    this.type = ZoneType.midfield, // Usiamo l'enum corretta (senza parentesi)
    this.weight = 1.0,
    this.tags = const [],
  });

  // Uguaglianza manuale (essenziale per l'ECS)
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Zone &&
          runtimeType == other.runtimeType &&
          x == other.x &&
          y == other.y &&
          type == other.type;

  @override
  int get hashCode => x.hashCode ^ y.hashCode ^ type.hashCode;
}

extension ZoneX on Zone {
  // Ora che ZoneType è una enum, i controlli sono semplicissimi
  bool get isDefensive => type == ZoneType.defensive;
  bool get isMidfield => type == ZoneType.midfield;
  bool get isAttacking => type == ZoneType.attacking;
  bool get isSpecial => type == ZoneType.special;

  Zone mirrorZone() => Zone(
    x: (FieldGrid.columns - 1 - x).toDouble(),
    y: y,
    type: type,
    tags: tags,
    weight: weight,
  );

  double distanceTo(Zone other) => (x - other.x).abs() + (y - other.y).abs();

  bool isAdjacentTo(Zone other) {
    final dx = (x - other.x).abs();
    final dy = (y - other.y).abs();
    return (dx + dy == 1);
  }

  bool isValid({int maxX = 10, int maxY = 5}) {
    return x >= 0 && x <= maxX && y >= 0 && y <= maxY;
  }

  // Se usi le enum, basta l'operatore == che abbiamo definito sopra
  bool isSameAs(Zone other) => this == other;

  bool hasTag(ZoneTag tag) => tags.contains(tag);

  Vector2 getZoneCenterNormalized() {
    final double zoneWidth = 1.0 / SoccerParameters.numOfSpotsX;
    final double zoneHeight = 1.0 / SoccerParameters.numOfSpotsY;

    final double normalizedX = x * zoneWidth + zoneWidth / 2;
    final double normalizedY = y * zoneHeight + zoneHeight / 2;

    return Vector2(normalizedX, normalizedY);
  }
}
