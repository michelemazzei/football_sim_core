import 'package:football_sim_core/ai/fsm/core/game_state.dart';
import 'package:football_sim_core/ai/fsm/messaging/telegram.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';

class StateMachine<EntityType> {
  final EntityType owner;
  GameState<EntityType>? currentState;
  GameState<EntityType>? previousState;
  GameState<EntityType>? globalState;
  final EcsWorld world;
  StateMachine(this.owner, this.world, {this.currentState, this.globalState});

  void update(double dt) {
    globalState?.execute(owner, dt, world);
    currentState?.execute(owner, dt, world);
  }

  bool handleMessage(Telegram telegram) =>
      (currentState?.onMessage(owner, telegram, world) ?? false) ||
      (globalState?.onMessage(owner, telegram, world) ?? false);

  void changeState(GameState<EntityType>? newState) {
    previousState = currentState;
    currentState?.exit(owner, world);
    currentState = newState;
    currentState?.enter(owner, world);
  }

  void revertToPreviousState() {
    changeState(previousState);
  }

  bool isInState(GameState<EntityType> state) =>
      currentState?.toString() == state.toString();
}
