import 'package:football_sim_core/ai/fsm/messaging/telegram.dart';
import 'package:football_sim_core/core/bricks/tactical_brick.dart';
import 'package:football_sim_core/core/ecs/components/tactical_role_component.dart';
import 'package:football_sim_core/core/ecs/messages/tactic_messages.dart';
import 'package:football_sim_core/core/field/field_grid.dart';
import 'package:football_sim_core/core/tactics/tactics.dart';
import 'package:football_sim_core/core/tactics/tactics_names.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/ecs/entities/player_entity.dart';

class ZoneTacticBrick extends TacticalBrick {
  @override
  TacticsName get id => TacticsName.zoneTactics();

  @override
  int get priority => 50;

  @override
  bool isApplicable(PlayerEntity player, EcsWorld world, Tactic tactic) {
    final team = player.getTeam();
    final roleComp = player.getComponent<TacticalRoleComponent>();
    if (roleComp == null || team == null) return false;

    final zone = tactic.zoneAssignments[roleComp.role];
    return zone != null;
  }

  @override
  List<Telegram> generateMessages(
    PlayerEntity player,
    FieldGrid grid,
    Tactic tactic,
  ) {
    final roleComp = player.getComponent<TacticalRoleComponent>();
    final team = player.getTeam();
    if (roleComp == null || team == null) return [];

    var zone = tactic.zoneAssignments[roleComp.role];
    if (zone == null) return [];
    var preferredAverageZone = zone;

    if (team.isRightSide) {
      preferredAverageZone = grid.mirrorZone(preferredAverageZone);
    }

    final telegram = TelegramUnion.create(
      sender: player,
      receiver: player,
      message: TacticalMoveToZone(
        receiver: player,
        targetZone: preferredAverageZone,
      ),
    );

    return [telegram];
  }
}
