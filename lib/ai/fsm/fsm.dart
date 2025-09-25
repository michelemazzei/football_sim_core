import 'package:football_sim_core/ai/fsm/core/game_state.dart';
import 'package:football_sim_core/ai/fsm/core/state_machine.dart';
import 'package:football_sim_core/ai/fsm/messaging/telegram.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/ecs/entities/ecs_entity.dart';

abstract class Fsm<T extends EcsEntity> {
  final StateMachine<T> _fsm;
  Fsm(T owner, EcsWorld world) : _fsm = StateMachine<T>(owner, world);

  StateMachine<T> get fsm => _fsm;

  T get owner => _fsm.owner;

  bool isInState(GameState<T> state) =>
      currentState?.runtimeType == state.runtimeType;

  void update(double dt) {
    _fsm.update(dt);
  }

  bool handleMessage(Telegram telegram) {
    return _fsm.handleMessage(telegram);
  }

  void changeState(GameState<T> newState) {
    _fsm.changeState(newState);
  }

  GameState<T>? get currentState => _fsm.currentState;
}
