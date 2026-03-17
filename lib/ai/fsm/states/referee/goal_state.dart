import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:football_sim_core/ai/config/field_geometry.dart';
import 'package:football_sim_core/ai/fsm/states/referee/kick_off_state.dart';
import 'package:football_sim_core/ai/fsm/states/referee/referee_base_state.dart';
import 'package:football_sim_core/ecs/components/ball_possession_component.dart';
import 'package:football_sim_core/ecs/components/ecs_components.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/ecs/entities/referee_entity.dart';
import 'package:football_sim_core/model/goal_event.dart';

class GoalState extends RefereeBaseState {
  double _timer = 0.0;
  static const double duration = 3.0; // 3 secondi di pausa/esultanza

  @override
  void doEnter(RefereeEntity entity, EcsWorld world) {
    // 1. Ferma il tempo
    world.getResource<GameClockComponent>()?.speedFactor = 0.0;

    final match = world.getResource<MatchComponent>();
    final clock = world.getResource<GameClockComponent>();
    final ball = world.requiredBall;
    final ballMoving = ball.getComponent<MovingComponent>();
    final ballPossession = world.getResource<BallPossessionComponent>()!;

    if (match != null && ballMoving != null && clock != null) {
      final ballPos = ballMoving.currentPosition;
      final goalResult = FieldGeometry.checkGoal(ballPos);

      if (goalResult != 0) {
        // Determiniamo quale team ha segnato (1 = Home, 2 = Away)
        // Se goalResult è 1 (porta sinistra), segna il team Away (2)
        // Se goalResult è 2 (porta destra), segna il team Home (1)
        final int scoringTeamId = (goalResult == 1) ? 2 : 1;

        // Logica Autogol: se l'ultimo che ha toccato è di un team diverso da chi riceve il punto
        final bool ownGoal =
            (ballPossession.lastPlayerId ?? scoringTeamId) != scoringTeamId;

        // 2. CREAZIONE E REGISTRAZIONE DELL'EVENTO
        final event = GoalEvent(
          minute: clock.minutes.toInt(),
          teamId: ballPossession.lastTeamId!,
          scorerId: ballPossession.lastPlayerId ?? -1,
          assistantId: ownGoal ? null : ballPossession.secondLastPlayerId,
          assistantTeamId: ballPossession.secondLastTeamId,
          isOwnGoal: ownGoal,
        );

        match.goalHistory.add(event);

        // 3. Aggiornamento punteggio classico
        if (scoringTeamId == 1) {
          match.scoreHome++;
        } else {
          match.scoreAway++;
        }

        debugPrint(
          "REGISTRO ARBITRO: ${event.isOwnGoal ? 'AUTOGOL' : 'GOAL'} al minuto ${event.minute}",
        );
        debugPrint("Punteggio: ${match.scoreHome} - ${match.scoreAway}");
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
