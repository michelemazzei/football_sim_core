enum PlayerState { idle, running, passing, shooting }

class PlayerStateComponent {
  PlayerState state;
  PlayerStateComponent(this.state);
}
