import 'package:football_sim_core/ai/fsm/core/state.dart';
import 'package:football_sim_core/ai/fsm/core/state_machine.dart';
import 'package:football_sim_core/ai/fsm/messaging/telegram.dart';

abstract class Fsm<T> {
  final StateMachine<T> _fsm;

  Fsm(T owner) : _fsm = StateMachine<T>(owner);

  void update() {
    _fsm.update();
  }

  bool handleMessage(Telegram telegram) {
    return _fsm.handleMessage(telegram);
  }

  void changeState(State<T> newState) {
    _fsm.changeState(newState);
  }

  State<T>? get currentState => _fsm.currentState;
}
