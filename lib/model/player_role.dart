enum PlayerRole {
  goalkeeper('Goalkeeper'),
  defender('Defender'),
  midfielder('Midfielder'),
  attacker('Attacker');

  final String label;
  const PlayerRole(this.label);

  @override
  String toString() => label;

  // Utility rapide per il Brain System
  bool get isGoalkeeper => this == PlayerRole.goalkeeper;
  bool get isDefender => this == PlayerRole.defender;
  bool get isMidfielder => this == PlayerRole.midfielder;
  bool get isAttacker => this == PlayerRole.attacker;
}
