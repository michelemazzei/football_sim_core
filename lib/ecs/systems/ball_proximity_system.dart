import 'dart:developer';

import 'package:football_sim_core/ai/steering/player_utils.dart';
import 'package:football_sim_core/ecs/components/ball_proximity_component.dart';
import 'package:football_sim_core/ecs/components/ecs_components.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/ecs/entities/ball_entity.dart';
import 'package:football_sim_core/ecs/entities/player_entity.dart';
import 'package:football_sim_core/ecs/systems/ecs_system.dart';

class BallProximitySystem extends EcsSystem {
  @override
  void update(EcsWorld world, double dt) {
    // Recupera il GameClockComponent come risorsa globale
    final clock = world.getResource<GameClockComponent>();
    if (clock == null) {
      log(name: 'BallProximitySystem', '⚠️ Nessun clock trovato nel mondo.');
      return;
    }
    final ball = world.entitiesWith<EcsBallComponent>().firstOrNull;
    if (ball == null) {
      log(name: 'BallProximitySystem', '⚠️ Nessuna palla trovata nel mondo.');
      return;
    }

    final players = world
        .entitiesWith<EcsPlayerComponent>()
        .whereType<PlayerEntity>()
        .toList();
    assert(() {
      if (players.isEmpty) {
        log(
          name: 'BallProximitySystem',
          "PossessionSystem: No players found in the world.",
        );
        return false;
      }
      if (players.length < 10) {
        log(name: 'BallProximitySystem', "too few players found in the world.");
        return false;
      }
      return true;
    }());
    final closestPlayers = PlayerUtils.findClosestPlayersToBall(
      players,
      ball as BallEntity,
    );
    assert(() {
      if (closestPlayers.isEmpty) {
        log(
          name: 'BallProximitySystem',
          "Non e' stato trovato alcun giocatore vicino alla palla.",
        );
        return false;
      }
      return true;
    }());
    // Se il tempo è scaduto, nessun giocatore può avere il possesso
    if (clock.isTimeUp || closestPlayers.isEmpty) {
      ball.addOrReplaceComponent<BallProximityComponent>(
        BallProximityComponent(),
      );
    } else {
      final closestPlayer = closestPlayers.first;
      ball.addOrReplaceComponent<BallProximityComponent>(
        BallProximityComponent(
          playerEntity: closestPlayer,
          teamId: closestPlayer.getComponent<TeamComponent>()?.team.id,
          distance: closestPlayer
              .getComponent<MovingComponent>()!
              .currentPosition
              .distanceTo(
                ball.getComponent<MovingComponent>()!.currentPosition,
              ),
        ),
      );
    }
  }
}
