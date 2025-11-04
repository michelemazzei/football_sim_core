import 'package:football_sim_core/core/ecs/components/team_phase_component.dart';
import 'package:football_sim_core/core/tactics/game_phases.dart';
import 'package:football_sim_core/ecs/components/ball_possession_component.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/ecs/entities/referee_entity.dart';
import 'package:football_sim_core/ecs/entities/team_entity.dart';
import 'package:football_sim_core/ecs/systems/ecs_system.dart';
import 'package:football_sim_core/model/team_id.dart';
import 'package:logging/logging.dart';

class GamePhaseSystem extends EcsSystem {
  final logger = Logger('core.ecs.systems.GamePhaseSystem');
  TeamId? previousPossession;
  double transitionTimer = 0.0;
  static const transitionDuration = 0.2; // secondi

  @override
  void update(EcsWorld world, double dt) {
    final teams = world.entitiesOf<TeamEntity>();
    final referee = world.entitiesOf<RefereeEntity>().firstOrNull;
    if (referee == null) {
      logger.severe('Referee not found!');
      return;
    }

    final ballPossession = referee.getComponent<BallPossessionComponent>();
    if (ballPossession == null) {
      return;
    }

    final currentPossession = ballPossession.teamId;

    // Cambio possesso → attiva transizione
    if (currentPossession != previousPossession) {
      transitionTimer = transitionDuration;
      previousPossession = currentPossession;
    }

    if (transitionTimer > 0) {
      transitionTimer -= dt;
      for (final team in teams) {
        final phase = team.getComponent<TeamPhaseComponent>();
        phase?.current = const GamePhase.transition();
      }
      return;
    }

    // Fase stabile: attacco o difesa
    for (final team in teams) {
      final phase = team.getComponent<TeamPhaseComponent>();
      if (team.teamId == currentPossession) {
        phase?.current = const GamePhase.attack();
      } else {
        phase?.current = const GamePhase.defense();
      }
    }
  }
}
