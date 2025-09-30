import 'package:football_sim_core/ai/fsm/components/fsm.dart';
import 'package:football_sim_core/ecs/components/ecs_components.dart';
import 'package:football_sim_core/ecs/entities/ecs_entity.dart';

mixin HasFsm<T extends EcsEntity> on IsFsmComponent {
  Fsm<T> get fsm;
}
