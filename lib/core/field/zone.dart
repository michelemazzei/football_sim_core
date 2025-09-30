import 'package:flame/game.dart';
import 'package:football_sim_core/core/field/field_grid.dart';
import 'package:football_sim_core/core/field/zone_tag.dart';
import 'package:football_sim_core/core/field/zone_types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'zone.freezed.dart';

@freezed
abstract class Zone with _$Zone {
  Zone._();
  factory Zone({
    required int x,
    required int y,
    @Default(ZoneType.mildfield()) ZoneType? type,
    @Default(1.0) double weight,
    @Default([]) List<ZoneTag> tags,
  }) = _Zone;
}

extension ZoneX on Zone {
  bool get isDefensive => type is DefensiveZone;
  bool get isMildfield => type is MildfieldZone;
  bool get isAttacking => type is AttackingZone;
  bool get isSpecial => type is SpecialZone;

  Vector2 get center => FieldGrid().centerOfZone(this);

  int distanceTo(Zone other) => (x - other.x).abs() + (y - other.y).abs();

  bool isAdjacentTo(Zone other) {
    final dx = (x - other.x).abs();
    final dy = (y - other.y).abs();
    return (dx + dy == 1);
  }

  bool isValid({int maxX = 10, int maxY = 5}) {
    return x >= 0 && x <= maxX && y >= 0 && y <= maxY;
  }

  bool hasTag(String tagName) => tags.any((tag) => tag.name == tagName);
}
