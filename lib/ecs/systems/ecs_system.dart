import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/ecs/entities/ecs_entity.dart';

abstract class EcsSystem {
  /// Chiamato ogni frame con il delta time e accesso al mondo ECS
  void update(EcsWorld world, double dt);

  /// Facoltativo: filtra le entità che interessano al sistema
  bool filter(EcsEntity entity) => true;
}
