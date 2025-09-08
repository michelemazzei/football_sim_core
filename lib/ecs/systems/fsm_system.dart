import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/ecs/systems/ecs_system.dart';
import 'package:logging/logging.dart';

abstract class FsmSystem extends EcsSystem {
  final logger = Logger('FsmSystem');
  @override
  void update(EcsWorld world, double dt);
}
