import 'package:football_sim_core/ai/pitch/pitch_role.dart';
import 'package:football_sim_core/ai/pitch/pitch_side.dart';

class PitchPosition {
  final PitchRole role;
  final PitchSide side;

  PitchPosition({required this.role, PitchSide? side})
    : assert(
        role != RoleGoalkeeper() || side == SideCenter(),
        'Goalkeeper must be in the center',
      ),
      side = side ?? SideCenter();

  @override
  String toString() => role.name + side.name;

  PitchPosition copyWith({PitchRole? role, PitchSide? side}) {
    return PitchPosition(role: role ?? this.role, side: side ?? this.side);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PitchPosition && other.role == role && other.side == side;
  }

  @override
  int get hashCode => role.hashCode ^ side.hashCode;
}
