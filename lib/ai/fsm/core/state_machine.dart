import 'package:football_sim_core/ai/fsm/core/game_state.dart';
import 'package:football_sim_core/ai/fsm/messaging/telegram.dart';

class StateMachine<EntityType> {
  final EntityType owner;
  GameState<EntityType>? currentState;
  GameState<EntityType>? previousState;
  GameState<EntityType>? globalState;

  StateMachine(this.owner, {this.currentState, this.globalState});

  void update(double dt) {
    globalState?.execute(owner, dt);
    currentState?.execute(owner, dt);
  }

  bool handleMessage(Telegram telegram) =>
      (currentState?.onMessage(owner, telegram) ?? false) ||
      (globalState?.onMessage(owner, telegram) ?? false);

  void changeState(GameState<EntityType>? newState) {
    previousState = currentState;
    currentState?.exit(owner);
    currentState = newState;
    currentState?.enter(owner);
  }

  void revertToPreviousState() {
    changeState(previousState);
  }

  bool isInState(GameState<EntityType> state) =>
      currentState?.toString() == state.toString();
}
