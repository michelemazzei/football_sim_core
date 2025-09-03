import 'package:football_sim_core/ecs/components/ecs_component.dart';

class BallTouchEventComponent extends EcsComponent {
  final int playerId;

  BallTouchEventComponent({required this.playerId});
}
