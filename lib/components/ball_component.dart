import 'package:flame/components.dart';
import 'package:football_sim_core/components/ball_trail.dart';
import 'package:football_sim_core/controllers/ball_controller.dart';
import 'package:football_sim_core/model/ball_model.dart';

import '../game/football_game.dart';

class BallComponent extends SpriteComponent
    with HasGameReference<FootballGame> {
  final maxSpeed = 100.0;
  late final BallController controller;

  BallComponent._({required Vector2 initialPosition})
    : super(anchor: Anchor.center) {
    position = initialPosition;
  }

  static Future<BallComponent> create(
    FootballGame game,
    Vector2 initialPosition,
  ) async {
    final image = await game.images.load('ball.png');
    final size = Vector2.all(image.width.toDouble().clamp(16, 64));
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

  @override
  Future<void> onLoad() async {
    await super.onLoad();
  }

  BallModel get ball => controller.model;

  @override
  void update(double dt) {
    super.update(dt);
    controller.update(dt);
    position = controller.position;

    // Rotazione proporzionale alla velocità
    if (controller.velocity.length2 > 1) {
      angle += controller.velocity.length * dt * 0.01;
    }

    if (controller.velocity.length2 > 20) {
      game.add(BallTrail(position.clone()));
    }
  }

  /// Metodo di utilità per "calciare" la palla
  void kick(Vector2 direction, double strength) {
    // direction dovrebbe essere normalizzato
    double clampedStrength = strength.clamp(0, maxSpeed);
    controller.velocity = direction.normalized() * clampedStrength;
  }
}
