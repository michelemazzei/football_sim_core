import 'package:football_sim_core/ai/fsm/fsm.dart';
import 'package:football_sim_core/ecs/components/ecs_components.dart';

mixin HasFsm<T> on IsFsmComponent {
  Fsm<T> get fsm;
}
