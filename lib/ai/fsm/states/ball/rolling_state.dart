import 'package:flame/game.dart';
import 'package:football_sim_core/ai/fsm/states/ball/ball_base_state.dart';
import 'package:football_sim_core/ai/fsm/states/ball/ball_stopped_state.dart';
import 'package:football_sim_core/ecs/components/ecs_components.dart';
import 'package:football_sim_core/ecs/entities/ball_entity.dart';

class RollingState extends BallBaseState {
  final Vector2 direction;
  final double force;

  RollingState({required this.direction, required this.force});

  @override
  void enter(BallEntity ball) {
    final moving = ball.getComponent<MovingComponent>();
    if (moving != null) {
      moving.velocity = direction * force;
    }
  }

  @override
  void execute(BallEntity ball, double dt) {
    final moving = ball.getComponent<MovingComponent>();
    if (moving == null) return;

    // Simula attrito
    moving.velocity *= 0.98;

    if (moving.velocity.length < 0.5) {
      moving.velocity = Vector2.zero();
      ball.getComponent<FsmComponent<BallEntity>>()!.fsm.changeState(
        BallStoppedState(),
      );
    }
  }

  @override
  void exit(BallEntity entity) {
    // do nothing
  }
}
