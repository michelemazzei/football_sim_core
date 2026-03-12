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
import 'package:football_sim_core/ecs/entities/team_entity.dart';

class CoverAssignedZoneTactic implements PlayerTactic {
  @override
  TacticsName get name => TacticsName.coverZoneTactic;

  @override
  double computeUtility(PlayerEntity player, EcsWorld world) {
    final roleComponent = player.getComponent<TacticalRoleComponent>();
    final team = player.getTeam();
    if (roleComponent == null || roleComponent.zones.isEmpty || team == null) {
      return 0.0;
    }
    final pos = player.position;
    final zones = team.isLeftSide
        ? roleComponent.zones
        : roleComponent.zones.map((zone) => zone.mirrorZone());
    final closestZone = _findClosestZone(pos, zones);
    final distance = pos.distanceTo(closestZone.getZoneCenterNormalized());

    const idealRadius = 10.0;
    return (1.0 - (distance / idealRadius)).clamp(0.0, 1.0);
  }

  @override
  GameState<PlayerEntity> createState(PlayerEntity player, EcsWorld world) {
    final roleComponent = player.getComponent<TacticalRoleComponent>();
    final team = player.getTeam();
    if (roleComponent == null || roleComponent.zones.isEmpty || team == null) {
      return PlayerIdleState();
    }
    if (roleComponent.zones.isEmpty) {
      return PlayerIdleState();
    }

    final pos = player.position;
    final zones = getZones(team, roleComponent);
    final closestZone = _findClosestZone(pos, zones);

    return MoveToTargetState(closestZone.getZoneCenterNormalized());
  }

  Iterable<Zone> getZones(
    TeamEntity team,
    TacticalRoleComponent roleComponent,
  ) {
    return team.isLeftSide
        ? roleComponent.zones
        : roleComponent.zones.map((zone) => zone.mirrorZone());
  }

  Zone _findClosestZone(Vector2 pos, Iterable<Zone> zones) {
    return zones.reduce(
      (a, b) =>
          pos.distanceTo(a.getZoneCenterNormalized()) <
              pos.distanceTo(b.getZoneCenterNormalized())
          ? a
          : b,
    );
  }
}
