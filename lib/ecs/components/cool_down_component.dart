import 'package:football_sim_core/ecs/components/ecs_component.dart';

class CooldownComponent extends EcsComponent {
  double remaining = 0.0;

  void start(double duration) {
    remaining = duration;
  }

  void update(double dt) {
    if (remaining > 0) {
      remaining -= dt;
    }
  }

  bool get isReady => remaining <= 0;
}
