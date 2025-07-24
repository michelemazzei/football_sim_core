import 'package:flame/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:football_sim_core/ai/config/soccer_parameters.dart';
import 'package:football_sim_core/ai/msg/message_receiver.dart';

/// Tipo di decelerazione usata nel comportamento `arrive`.
enum Deceleration { fast, normal, slow, none }

/// Rappresenta un’entità mobile nel gioco (es. un giocatore).
class MovingEntity extends MessageReceiver {
  Vector2 oldPosition;
  Vector2 heading;
  Vector2 currentPosition;
  Vector2 velocity;

  double maxSpeed;
  double panicDistance;
  double mass;

  MovingEntity({
    Vector2? oldPosition,
    required String uuid,
    required this.heading,
    Vector2? currentVelocity,
    required this.currentPosition,
    required this.maxSpeed,
    required this.panicDistance,
    required this.mass,
  }) : velocity = currentVelocity ?? Vector2.zero(),
       oldPosition = oldPosition ?? currentPosition,
       super(uuid);

  double get speed => velocity.length;
  double get speed2 => velocity.length2;

  /// Blocca il movimento dell’entità.
  void trap() {
    velocity = Vector2.zero();
  }

  /// Verifica se l’entità si sta muovendo.
  bool isMoving() => speed2 > 1;

  /// Aggiorna la posizione in base alla velocità.
  @mustCallSuper
  void update(double dt) {
    oldPosition = currentPosition;
    currentPosition += velocity;
  }

  /// Applica attrito per rallentare gradualmente.
  void friction({double friction = SoccerParameters.ballFriction}) {
    if (velocity.length2 > 0.9 && velocity.length2 > friction * friction) {
      velocity.scaleTo(velocity.length * (1 + friction));
    } else {
      velocity.scaleTo(0);
    }
  }

  /// Imposta la velocità e aggiorna l’heading se necessario.
  void setVelocity(Vector2 vel) {
    velocity = vel;
    if (velocity.length2 > 0.001) {
      heading = velocity.normalized();
    }
  }

  /// Riposiziona l’entità e resetta la velocità.
  void placeAtPosition(Vector2 position) {
    oldPosition = currentPosition;
    currentPosition = position;
    velocity = Vector2.zero();
  }

  /// Verifica se un altro punto è vicino.
  bool neighbor(Vector2 other) =>
      currentPosition.distanceTo(other) < SoccerParameters.neighborsRadius;

  /// Vettore ortogonale all’heading (direzione laterale).
  Vector2 get side => heading.scaleOrthogonalInto(-1, Vector2.zero());

  /// Imposta un nuovo heading, se è valido.
  void setHeading(Vector2 newHeading) {
    if (newHeading.length2 > 0.00001) {
      heading = newHeading.normalized();
    }
  }
}
