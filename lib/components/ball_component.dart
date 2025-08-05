import 'package:flame/components.dart';
import 'package:football_sim_core/components/ball_trail.dart';
import 'package:football_sim_core/controllers/soccer_ball_controller.dart';
import 'package:football_sim_core/model/soccer_ball_model.dart';

import '../game/football_game.dart';

class BallComponent extends SpriteComponent
    with HasGameReference<FootballGame> {
  final maxSpeed = 100.0; // velocità massima della palla
  late final SoccerBallController controller;

  BallComponent({Vector2? initialPosition}) : super(anchor: Anchor.center) {
    if (initialPosition != null) {
      position = initialPosition;
    }
  }
  @override
  Future<void> onLoad() async {
    await super.onLoad();

    // 1. Carica lo sprite
    sprite = await game.loadSprite('ball.png');

    // 2. Imposta le dimensioni in base alla texture
    final image = await game.images.load('ball.png');
    size = Vector2.all(image.width.toDouble().clamp(16, 64));
    // Qui limitiamo la dimensione tra 16 e 64 pixel;
    // adegua i valori come preferisci

    // 3. Se non ho già un position passato via costruttore, centro
    position = position.isZero() ? game.size / 2 : position;
    final model = SoccerBallModel(
      position: position.clone(),
      velocity: Vector2.zero(),
    );
    final controller = SoccerBallController(
      model: model,
      size: size.clone(),
      gameSize: game.size.clone(),
      initialPosition: position.clone(),
    );
    this.controller = controller;
  }

  SoccerBallModel get ball => controller.model;

  @override
  void update(double dt) {
    super.update(dt);
    controller.update(dt);
    position = controller.position;

    if (controller.velocity.length2 > 20) {
      // genera una scia istantanea in corrispondenza del centro della palla
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
