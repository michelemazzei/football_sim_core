enum GamePhase {
  buildUp(0),
  transition(1),
  defense(2),
  attack(3),
  kickoff(4);

  final int id;
  const GamePhase(this.id);

  @override
  String toString() => 'GamePhase.$name';
}
