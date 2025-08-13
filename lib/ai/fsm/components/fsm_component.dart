import 'package:football_sim_core/ecs/components/ecs_component.dart';
import 'package:football_sim_core/ai/fsm/core/game_state.dart';
import 'package:football_sim_core/ai/fsm/messaging/telegram.dart';

import '../fsm.dart';

class FsmComponent<T> extends EcsComponent {
  final Fsm<T> fsm;

  FsmComponent(this.fsm);

  void updateFSM() {
    fsm.update();
  }

  bool handleMessage(Telegram telegram) {
    return fsm.handleMessage(telegram);
  }

  GameState<T>? get currentState => fsm.currentState;
}
