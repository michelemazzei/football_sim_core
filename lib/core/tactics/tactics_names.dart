enum TacticsName {
  coverZoneTactic('COVER_ZONE'),
  zoneTactic('ZONE_TACTIC'),
  ballFollowTactic('BALL_FOLLOW');

  final String label;
  const TacticsName(this.label);

  @override
  String toString() => label;
}
