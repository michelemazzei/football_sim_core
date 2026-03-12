enum ZoneType {
  goalLine('GoalLine'),
  defensive('Defensive'),
  midfield('Midfield'),
  attacking('Attacking'),
  special('Special');

  final String name;
  const ZoneType(this.name);

  @override
  String toString() => name;
}
