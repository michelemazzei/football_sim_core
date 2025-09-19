import 'package:football_sim_core/ai/fsm/states/ball/ball_idle_state.dart';
import 'package:football_sim_core/ai/fsm/states/ball/ball_stopped_state.dart';
import 'package:football_sim_core/ai/fsm/states/ball/out_of_play_state.dart';
import 'package:football_sim_core/ai/fsm/states/ball/rolling_state.dart';
import 'package:football_sim_core/ecs/components/ball_intent_component.dart';
import 'package:football_sim_core/ecs/components/ecs_components.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/ecs/entities/ball_entity.dart';
import 'package:football_sim_core/ecs/systems/fsm_system.dart';

class BallFsmSystem extends FsmSystem {
  @override
  void update(EcsWorld world, double dt) {
    final entities = world.entitiesWith<FsmComponent<BallEntity>>();
    for (final entity in entities) {
      entity.getComponent<FsmComponent<BallEntity>>()?.updateFSM(
        world.scaledDt,
      );
    }
    final balls = world
        .entitiesWithAll<BallIntentComponent, FsmComponent<BallEntity>>();
    for (final ball in balls) {
      final intent = ball.getComponent<BallIntentComponent>();
      if (intent == null) continue;
      final intentType = ball.getComponent<BallIntentComponent>()?.intent;
      final fsm = ball.getComponent<FsmComponent<BallEntity>>()?.fsm;
      if (fsm == null || intentType == null) continue;

      switch (intentType) {
        case BallIntent.kicked:
          fsm.changeState(
            RollingState(direction: intent.direction, force: intent.force),
          );
          break;
        case BallIntent.stopped:
          fsm.changeState(BallStoppedState());
          break;
        case BallIntent.outOfPlay:
          fsm.changeState(OutOfPlayState());
          break;
        case BallIntent.idle:
          fsm.changeState(BallIdleState());
          break;
      }

      ball.removeComponent<BallIntentComponent>();
    }
  }
}
