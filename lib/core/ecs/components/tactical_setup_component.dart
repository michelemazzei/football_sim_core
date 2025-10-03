import 'package:football_sim_core/ecs/components/ecs_components.dart';
import 'package:football_sim_core/model/tactical_setup.dart';

class TacticalSetupComponent extends EcsComponent {
  TacticalSetup setup;
  TacticalSetupComponent({required this.setup});
}
