import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:football_sim_core/ai/config/field_geometry.dart';
import 'package:football_sim_core/ai/fsm/states/referee/kick_off_state.dart';
import 'package:football_sim_core/ai/fsm/states/referee/referee_base_state.dart';
import 'package:football_sim_core/ecs/components/ecs_components.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/ecs/entities/referee_entity.dart';

class GoalState extends RefereeBaseState {
  double _timer = 0.0;
  static const double duration = 3.0; // 3 secondi di pausa/esultanza

  @override
  void doEnter(RefereeEntity entity, EcsWorld world) {
    // 1. Ferma il tempo immediatamente
    world.getResource<GameClockComponent>()?.speedFactor = 0.0;

    // 2. Recuperiamo il MatchComponent (la tua risorsa)
    final match = world.getResource<MatchComponent>();
    final ballPos = world.ball
        ?.getComponent<MovingComponent>()
        ?.currentPosition;

    if (match != null && ballPos != null) {
      final goalResult = FieldGeometry.checkGoal(ballPos);

      if (goalResult == 1) {
        // Palla nella porta sinistra -> Segna la squadra AWAY
        match.scoreAway++;
        debugPrint(
          "GOAL AWAY! Nuovo punteggio: ${match.scoreHome} - ${match.scoreAway}",
        );
      } else if (goalResult == 2) {
        // Palla nella porta destra -> Segna la squadra HOME
        match.scoreHome++;
        debugPrint(
          "GOAL HOME! Nuovo punteggio: ${match.scoreHome} - ${match.scoreAway}",
        );
      }
    }
  }

  @override
  void doExecute(RefereeEntity entity, double dt, EcsWorld world) {
    _timer += dt;

    if (_timer >= duration) {
      // PRIMA di passare al Kickoff, prepariamo il campo
      _prepareCenterCircle(world);

      entity.getComponent<FsmComponent<RefereeEntity>>()?.fsm.changeState(
        KickoffState(),
      );
    }
  }

  void _prepareCenterCircle(EcsWorld world) {
    // Portiamo la palla al centro esatto (0.5, 0.5)
    final ballMoving = world.ball?.getComponent<MovingComponent>();
    ballMoving?.currentPosition = Vector2(0.5, 0.5);
    ballMoving?.velocity = Vector2.zero();

    // Resettiamo il flag dell'uscita palla
    world.ball?.getComponent<BallOutOfBoundsComponent>()?.reset();

    debugPrint("ARBITRO: Palla posizionata al centro. Pronti per il Kickoff.");
  }
}
