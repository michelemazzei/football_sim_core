import 'package:football_sim_core/ai/decision/action_intent.dart';
import 'package:football_sim_core/ai/decision/decision_module.dart';
import 'package:football_sim_core/ecs/components/ecs_component.dart';

class PlayerBrainComponent extends EcsComponent {
  DecisionModule ballCarrierModule;
  DecisionModule supportModule;
  DecisionModule defensiveModule;

  ActionIntent? intent;
  bool isUserControlled = false;

  PlayerBrainComponent({
    required this.ballCarrierModule,
    required this.supportModule,
    required this.defensiveModule,
  });
  void setIntent(ActionIntent newIntent, {bool fromUser = false}) {
    intent = newIntent;
    isUserControlled = fromUser;
  }
}
