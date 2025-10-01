import 'package:football_sim_core/core/ecs/components/tactical_role_component.dart';
import 'package:football_sim_core/core/ecs/messages/tactic_messages.dart';
import 'package:football_sim_core/core/field/field_grid.dart';
import 'package:football_sim_core/core/tactics/game_phases.dart';
import 'package:football_sim_core/core/tactics/tactical_zone_map.dart';
import 'package:football_sim_core/ecs/components/ecs_components.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/ecs/systems/ecs_system.dart';

class ZoneTacticSystem extends EcsSystem {
  final TacticalZoneMap zoneMap;
  final GamePhase currentPhase;
  final bool isTeamOnRight;

  ZoneTacticSystem(this.zoneMap, this.currentPhase, this.isTeamOnRight);

  @override
  void update(EcsWorld world, double dt) {
    // final sender = world.getResource<MessageSenderComponent>();
    // if (sender == null) return;
    // for (final entity in world.entitiesWith<TacticalRoleComponent>()) {
    //   final role = entity.getComponent<TacticalRoleComponent>()?.role;
    //   if (role == null) continue;
    //   var zone = zoneMap.getZoneFor(role, currentPhase);
    //   if (zone != null && isTeamOnRight) {
    //     zone = FieldGrid().mirrorZone(zone);
    //   }
    //   if (zone != null) {
    //     sender.sendMessage(
    //       sender: entity,
    //       receiver: entity,
    //       message: TacticalMoveToZone(receiver: entity, targetZone: zone),
    //     );
    //   }
    // }
  }
}
