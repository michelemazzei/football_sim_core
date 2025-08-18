import 'package:football_sim_core/ecs/components/ecs_component.dart';

class BallOutOfBoundsComponent extends EcsComponent {
  final bool isOutOfBounds;

  BallOutOfBoundsComponent([this.isOutOfBounds = false]);
}
