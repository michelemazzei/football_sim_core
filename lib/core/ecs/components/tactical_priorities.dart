enum TacticalPriority implements Comparable<TacticalPriority> {
  low(10),
  medium(50),
  high(100),
  highest(200);

  final int value;
  const TacticalPriority(this.value);

  @override
  int compareTo(TacticalPriority other) => value.compareTo(other.value);

  // Operatori di confronto personalizzati
  bool operator <(TacticalPriority other) => value < other.value;
  bool operator <=(TacticalPriority other) => value <= other.value;
  bool operator >(TacticalPriority other) => value > other.value;
  bool operator >=(TacticalPriority other) => value >= other.value;

  @override
  String toString() => 'Priority($name: $value)';
}
