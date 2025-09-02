import 'package:football_sim_core/ecs/entities/referee_entity.dart';
import 'package:football_sim_core/ai/fsm/states/referee/referee_base_state.dart';

class GlobalRefereeState extends RefereeBaseState {
  @override
  void enter(RefereeEntity match) {}

  @override
  void execute(RefereeEntity entity, double dt) {}

  @override
  void exit(RefereeEntity match) {}
}
