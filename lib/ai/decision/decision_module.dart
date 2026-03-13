import 'dart:math';

import 'package:collection/collection.dart';
import 'package:flame/components.dart';
import 'package:football_sim_core/ai/decision/action_intent.dart';
import 'package:football_sim_core/ai/perception/perception_module.dart';
import 'package:football_sim_core/core/field/field_grid.dart';
import 'package:football_sim_core/core/field/zone.dart';
import 'package:football_sim_core/core/field/zone_types.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/ecs/entities/player_entity.dart';
import 'package:football_sim_core/model/team_id.dart';

part 'ball_carrier_decision_module.dart';
// Dichiarazione dei file che compongono questa classe
part 'defensive_decision_module.dart';
part 'support_decision_module.dart';

sealed class DecisionModule {
  final Random _random = Random();
  final PerceptionModule perception;
  final FieldGrid grid;
  final EcsWorld world;
  DecisionModule({
    required this.world,
    required this.perception,
    required this.grid,
  });

  ActionIntent decideAction(
    PlayerEntity me,
    List<PlayerEntity> teammates,
    List<PlayerEntity> opponents,
  );

  /// Genera un numero con distribuzione più centrale (meno caotica)
  double centralRandom() {
    return (_random.nextDouble() + _random.nextDouble()) / 2;
  }
}
