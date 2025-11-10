import 'package:flame/components.dart';
import 'package:football_sim_core/ai/fsm/entities/game_state.dart';
import 'package:football_sim_core/ai/fsm/states/player/player_idle_state.dart';
import 'package:football_sim_core/core/ecs/components/tactical_role_component.dart';
import 'package:football_sim_core/core/field/zone.dart';
import 'package:football_sim_core/core/fsm/state/move_to_target_state.dart';
import 'package:football_sim_core/core/tactics/player_tactics/player_tactic.dart';
import 'package:football_sim_core/core/tactics/tactics_names.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/ecs/entities/player_entity.dart';

class CoverAssignedZoneTactic implements PlayerTactic {
  @override
  TacticsName get name => TacticsName.coverZoneTactic();

  @override
  double computeUtility(PlayerEntity player, EcsWorld world) {
    final roleComponent = player.getComponent<TacticalRoleComponent>();
    if (roleComponent == null || roleComponent.zones.isEmpty) return 0.0;

    final pos = player.position;
    final closestZone = _findClosestZone(pos, roleComponent.zones);
    final distance = pos.distanceTo(closestZone.getZoneCenterNormalized());

    const idealRadius = 100.0;
    return (1.0 - (distance / idealRadius)).clamp(0.0, 1.0);
  }

  @override
  GameState<PlayerEntity> createState(PlayerEntity player, EcsWorld world) {
    final roleComponent = player.getComponent<TacticalRoleComponent>();
    if (roleComponent == null || roleComponent.zones.isEmpty) {
      return PlayerIdleState();
    }

    final pos = player.position;
    final closestZone = _findClosestZone(pos, roleComponent.zones);

    return MoveToTargetState(closestZone.getZoneCenterNormalized());
  }

  Zone _findClosestZone(Vector2 pos, List<Zone> zones) {
    return zones.reduce(
      (a, b) =>
          pos.distanceTo(a.getZoneCenterNormalized()) <
              pos.distanceTo(b.getZoneCenterNormalized())
          ? a
          : b,
    );
  }
}
