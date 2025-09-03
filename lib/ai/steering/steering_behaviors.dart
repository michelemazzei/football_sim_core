import 'dart:math';
import 'package:flame/components.dart';
import 'package:football_sim_core/ai/steering/transformations.dart';
import 'package:football_sim_core/ai/config/soccer_parameters.dart';
import 'dart:developer' as developer;

import 'package:football_sim_core/ecs/components/ecs_components.dart';

/// Comportamenti di steering per entità mobili.
class SteeringBehaviors {
  /// Spinge l'entità verso la posizione target.
  static Vector2 seek(MovingComponent entity, Vector2 targetPosition) {
    final desiredVelocity =
        (targetPosition - entity.currentPosition).normalized() *
        entity.maxSpeed;
    return desiredVelocity - entity.velocity;
  }

  /// Allontana l'entità da una minaccia vicina.
  static Vector2 flee(MovingComponent entity, Vector2 targetPosition) {
    if (entity.currentPosition.distanceTo(targetPosition) >
        SoccerParameters.playerComfortZone) {
      return Vector2.zero();
    }

    final desiredVelocity =
        (entity.currentPosition - targetPosition).normalized() *
        entity.maxSpeed;
    return desiredVelocity - entity.velocity;
  }

  /// Raggiunge un punto rallentando.
  static Vector2 arrive(
    MovingComponent entity,
    Vector2 targetPosition, {
    Deceleration deceleration = Deceleration.normal,
    double distance = 20.0,
  }) {
    final toTarget = targetPosition - entity.currentPosition;

    if (toTarget.length <= distance) return Vector2.zero();

    const decelerationTweaker = 50;
    final speed = min(
      entity.maxSpeed,
      distance / decelerationTweaker * (deceleration.index + 1),
    );

    final desiredVelocity = (toTarget * speed / distance) - entity.velocity;
    desiredVelocity.length = min(desiredVelocity.length, entity.maxSpeed);
    return desiredVelocity;
  }

  /// Insegue un evader predicendo la sua posizione futura.
  static Vector2 pursuit(MovingComponent entity, MovingComponent evader) {
    if (entity == evader) return Vector2.zero();

    final toEvader = evader.currentPosition - entity.currentPosition;
    final relativeHeading = entity.heading.dot(evader.heading);

    if (toEvader.dot(entity.heading) > 0 && relativeHeading < -0.95) {
      return seek(entity, evader.currentPosition);
    }

    final lookAheadTime =
        toEvader.length / (entity.maxSpeed + evader.velocity.length);
    final futurePosition =
        evader.currentPosition + evader.velocity * lookAheadTime;

    return seek(entity, futurePosition);
  }

  /// Fugge da un pursuer predicendo la sua posizione futura.
  static Vector2 evade(MovingComponent entity, MovingComponent pursuer) {
    if (entity == pursuer) return Vector2.zero();

    final toPursuer = pursuer.currentPosition - entity.currentPosition;
    final lookAheadTime =
        toPursuer.length / (entity.maxSpeed + pursuer.velocity.length);
    final futurePosition =
        pursuer.currentPosition + pursuer.velocity * lookAheadTime;

    return flee(entity, futurePosition);
  }

  static bool neighbor(Vector2 currentPosition, Vector2 other) =>
      currentPosition.distanceTo(other) < SoccerParameters.neighborsRadius;
  static Vector2 side(Vector2 heading) =>
      heading.scaleOrthogonalInto(-1, Vector2.zero());

  /// Calcola l’ostacolo più pericoloso tra gli enti vicini.
  static List<Vector2?> _findMostThreatening(
    MovingComponent entity,
    List<Vector2> entities,
  ) {
    final taggedObstacles = <Vector2>[
      for (final e in entities)
        if (e != entity.currentPosition && neighbor(entity.currentPosition, e))
          e,
    ];

    Vector2? closest;
    Vector2? localClosest;
    const radius = SoccerParameters.playerRadius;
    double minDistance = double.infinity;

    for (final obstacle in taggedObstacles) {
      final localPos = Transformations.pointToLocalSpace(
        obstacle,
        entity.heading,
        side(entity.heading),
        entity.currentPosition,
      );

      if (localPos.x > 0 && localPos.y.abs() < radius) {
        var sqrtPart = sqrt(radius * radius - localPos.y * localPos.y);
        var ip = localPos.x - sqrtPart;
        if (ip < 0) ip = localPos.x + sqrtPart;

        if (ip < minDistance) {
          minDistance = ip;
          closest = obstacle;
          localClosest = localPos;
        }
      }
    }

    return [closest, localClosest];
  }

  /// Calcola la forza di sterzata per evitare ostacoli.
  static Vector2 obstacleAvoidance(
    MovingComponent entity,
    List<Vector2> entities,
  ) {
    var force = Vector2.zero();
    final threat = _findMostThreatening(entity, entities);

    if (threat[0] != null) {
      final local = threat[1]!;
      developer.log('local point obstacle $local', name: 'STEERING');

      final multiplier =
          1.0 +
          (SoccerParameters.neighborsRadius -
                  min(SoccerParameters.neighborsRadius, local.length)) /
              SoccerParameters.neighborsRadius;

      final brakingWeight = 0.1;
      Vector2 lateralForce;

      if (local.y.abs() < SoccerParameters.neighborsRadius) {
        lateralForce = local.y < 0
            ? Vector2(0, 2 * SoccerParameters.neighborsRadius.toDouble())
            : Vector2(0, -2 * SoccerParameters.neighborsRadius.toDouble());
      } else {
        lateralForce = Vector2(0, -local.y);
      }

      final brakingForce = Vector2(-local.x, 0);

      force = (lateralForce * multiplier + brakingForce * brakingWeight);
      force = Transformations.vectorToWorldSpace(
        force,
        entity.heading,
        side(entity.heading),
      );

      if (force.length > entity.maxSpeed) {
        force.length = entity.maxSpeed;
      }
    }

    return force;
  }
}
