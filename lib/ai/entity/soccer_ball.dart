import 'dart:math';

import 'package:flame/components.dart';
import 'package:football_sim_core/ai/config/soccer_parameters.dart';
import 'package:football_sim_core/ai/entity/soccer_player.dart';
import 'package:football_sim_core/ai/fsm/state_machine.dart';
import 'package:football_sim_core/ai/moving_entity.dart';
import 'package:football_sim_core/ai/msg/telegram.dart';

class SoccerBall extends MovingEntity {
  late final StateMachine<SoccerBall> stateMachine;
  SoccerPlayer? owner;
  SoccerPlayer? lastOwner;
  SoccerBall({Vector2? position})
    : super(
        uuid: 'SOCCER_BALL',
        heading: Vector2.zero(),
        currentVelocity: Vector2.zero(),
        currentPosition: position ?? Vector2.zero(),
        maxSpeed: SoccerParameters.ballMaxSpeed,
        panicDistance: SoccerParameters.ballPanicDistance,
        mass: SoccerParameters.ballMass,
      ) {
    stateMachine = StateMachine<SoccerBall>(this);
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (owner != null) {
      currentPosition =
          (owner!.heading.clone()..length = 15) + owner!.currentPosition;
    } else {
      friction();
    }
    stateMachine.update();
  }

  void kick(Vector2 direction, double force) {
    lastOwner = owner;
    owner = null;
    var acceleration = (direction.normalized() * force) / mass;
    velocity = acceleration;
  }

  Vector2 futurePosition(double time) {
    var ut = velocity * time;
    var halfAccelerationTime2 =
        0.5 * SoccerParameters.ballFriction * time * time;
    var scalarToVector = velocity.normalized() * halfAccelerationTime2;
    return currentPosition.clone() + ut + scalarToVector;
  }

  double timeToCoverDistance(Vector2 a, Vector2 b, double force) {
    var speed = force / SoccerParameters.ballMass;
    var distanceToCover = a.distanceTo(b);
    var term =
        speed * speed + 2.0 * distanceToCover * SoccerParameters.ballFriction;
    if (term <= 0.0) {
      return -1.0;
    }
    return (sqrt(term) - speed) / SoccerParameters.ballFriction;
  }

  @override
  bool handleMessage(Telegram telegram) => stateMachine.handleMessage(telegram);
}
