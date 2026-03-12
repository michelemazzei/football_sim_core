enum TacticalIntent {
  none('NONE'),
  kickoff('KICKOFF'),
  pressing('PRESSING'),
  attacking('ATTACKING'),
  defending('DEFENDING'),
  coveringZone('COVERING_ZONE'),
  supportingAttacker('SUPPORTING_ATTACKER');

  final String code;
  const TacticalIntent(this.code);

  @override
  String toString() => code;
}
