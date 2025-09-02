import 'package:football_sim_core/ecs/components/ecs_component.dart';

class PossessionComponent extends EcsComponent {
  bool hasBall;
  PossessionComponent([this.hasBall = false]);
}
