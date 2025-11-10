import 'package:football_sim_core/ai/fsm/messaging/messaging.dart';
import 'package:football_sim_core/core/field/field_grid.dart';
import 'package:football_sim_core/core/tactics/tactics.dart';
import 'package:football_sim_core/core/tactics/tactics_names.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/ecs/entities/player_entity.dart';

abstract class TacticalBrick {
  bool get ignoresOverride => false;

  TacticsName get id;
  int get priority;

  bool isApplicable(PlayerEntity player, EcsWorld world, Tactic tactic);

  List<Telegram> generateMessages(
    PlayerEntity player,
    FieldGrid grid,
    Tactic tactic,
  );
}
