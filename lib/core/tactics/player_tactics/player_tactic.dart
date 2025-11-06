// lib/core/tactics/player_tactics/player_tactic.dart

import 'package:football_sim_core/ai/fsm/entities/game_state.dart';
import 'package:football_sim_core/core/tactics/tactics_names.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/ecs/entities/player_entity.dart';

abstract class PlayerTactic {
  /// Nome identificativo della tattica
  TacticsName get name;

  /// Calcola l'utilità della tattica per il giocatore in questo momento
  double computeUtility(PlayerEntity player, EcsWorld world);

  /// Crea lo stato FSM da attivare se la tattica viene scelta
  GameState<PlayerEntity> createState(PlayerEntity player, EcsWorld world);
}
