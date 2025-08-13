import 'package:football_sim_core/ai/fsm/core/game_state.dart';
import 'package:football_sim_core/ai/fsm/core/state_machine.dart';
import 'package:football_sim_core/ai/fsm/messaging/telegram.dart';

abstract class Fsm<T> {
  final StateMachine<T> _fsm;

  StateMachine<T> get fsm => _fsm;

  Fsm(T owner) : _fsm = StateMachine<T>(owner);

  void update() {
    _fsm.update();
  }

  bool handleMessage(Telegram telegram) {
    return _fsm.handleMessage(telegram);
  }

  void changeState(GameState<T> newState) {
    _fsm.changeState(newState);
  }

  GameState<T>? get currentState => _fsm.currentState;
}
