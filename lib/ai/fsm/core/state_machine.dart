import 'package:football_sim_core/ai/fsm/core/state.dart';
import 'package:football_sim_core/ai/fsm/messaging/telegram.dart';

class StateMachine<EntityType> {
  final EntityType owner;
  State<EntityType>? currentState;
  State<EntityType>? previousState;
  State<EntityType>? globalState;

  StateMachine(this.owner, {this.currentState, this.globalState});

  void update() {
    globalState?.execute(owner);
    currentState?.execute(owner);
  }

  bool handleMessage(Telegram telegram) =>
      (currentState?.onMessage(owner, telegram) ?? false) ||
      (globalState?.onMessage(owner, telegram) ?? false);

  void changeState(State<EntityType>? newState) {
    previousState = currentState;
    currentState?.exit(owner);
    currentState = newState;
    currentState?.enter(owner);
  }

  void revertToPreviousState() {
    changeState(previousState);
  }

  bool isInState(State<EntityType> state) =>
      currentState?.toString() == state.toString();
}
