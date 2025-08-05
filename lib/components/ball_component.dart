import 'package:flame/components.dart';
import 'package:football_sim_core/components/ball_trail.dart';
import 'package:football_sim_core/components/field_bound_component.dart';
import 'package:football_sim_core/controllers/ball_controller.dart';
import 'package:football_sim_core/model/ball_model.dart';

import '../game/football_game.dart';

class BallComponent extends FieldBoundComponent {
  final maxSpeed = 400.0;

  final angleSpin = 0.02;

  late final BallController controller;
  BallModel get ball => controller.model;

  static Future<BallComponent> create(
    FootballGame game,
    Vector2 initialPosition,
  ) async {
    final image = await game.images.load('ball.png');
    final size = Vector2.all(image.width.toDouble().clamp(16, 62));
    final sprite = await game.loadSprite('ball.png');

    final controller = BallController(
      model: BallModel(
        position: initialPosition.clone(),
        velocity: Vector2.zero(),
      ),
      size: size.clone(),
      gameSize: game.size.clone(),
      initialPosition: initialPosition.clone(),
    );

    final ball = BallComponent._(initialPosition: initialPosition);
    ball
      ..sprite = sprite
      ..size = size
      ..controller = controller;

    return ball;
  }

  BallComponent._({required Vector2 initialPosition}) {
    anchor = Anchor.center;
    position = initialPosition;
    relativePosition = Vector2(0.5, 0.5);
    sizeRatio = 0.02;
  }

  @override
  void update(double dt) {
    super.update(dt);
    controller.update(dt);
    position = controller.position;
    updateRelativePosition();

    if (controller.velocity.length2 > 1) {
      angle += controller.velocity.length * dt * angleSpin;
    }
    if (controller.velocity.length2 > 20) {
      game.add(BallTrail(position.clone()));
    }
  }

  @override
  void onResizeAndReposition() {
    //  Aggiorna anche il controller
    controller.model.position = position.clone();
  }

  /// Metodo di utilità per "calciare" la palla
  void kick(Vector2 direction, double strength) {
    // direction dovrebbe essere normalizzato
    double clampedStrength = strength.clamp(0, maxSpeed);
    controller.velocity = direction.normalized() * clampedStrength;
    updateRelativePosition();
  }
}
