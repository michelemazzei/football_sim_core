enum ZoneTag {
  goal('GOAL'),
  penalty('PENALTY'),
  left('LEFT'),
  center('CENTER'),
  right('RIGHT'),
  other('OTHER');

  final String name;
  const ZoneTag(this.name);

  @override
  String toString() => name;
}
