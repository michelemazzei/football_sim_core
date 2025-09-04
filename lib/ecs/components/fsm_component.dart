import 'package:football_sim_core/ai/fsm/core/game_state.dart';
import 'package:football_sim_core/ai/fsm/messaging/telegram.dart';
import 'package:football_sim_core/ecs/components/has_fsm.dart';
import 'package:football_sim_core/ecs/components/is_fsm_component.dart';

import '../../ai/fsm/fsm.dart';

class FsmComponent<T> extends IsFsmComponent with HasFsm<T> {
  @override
  final Fsm<T> fsm;

  FsmComponent(this.fsm);

  void updateFSM(double dt) {
    fsm.update(dt);
  }

  @override
  bool handleMessage(Telegram telegram) {
    return fsm.handleMessage(telegram);
  }

  GameState<T>? get currentState => fsm.currentState;
}
