import 'dart:ui';

import 'package:football_sim_core/controllers/entity_controller.dart';

@Deprecated('use ECS System')
class BallController extends EntityController {
  final VoidCallback? onBallOutOfBounds;

  BallController({
    required super.entity,
    required super.game,

    this.onBallOutOfBounds,
  });

  @override
  void handleCollision() {
    final halfW = size.x / 2;
    final halfH = size.y / 2;
    final pos = position;

    final outLeft = pos.x - halfW < 0;
    final outRight = pos.x + halfW > gameSize.x;
    final outTop = pos.y - halfH < 0;
    final outBottom = pos.y + halfH > gameSize.y;

    if (outLeft || outRight || outTop || outBottom) {
      onBallOutOfBounds?.call();
    }
  }
}
