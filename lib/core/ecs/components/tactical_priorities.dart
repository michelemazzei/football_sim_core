import 'package:freezed_annotation/freezed_annotation.dart';

part 'tactical_priorities.freezed.dart';

@freezed
sealed class TacticalPriority
    with _$TacticalPriority
    implements Comparable<TacticalPriority> {
  const TacticalPriority._();
  const factory TacticalPriority.low() = _Low;
  const factory TacticalPriority.medium() = _Medium;
  const factory TacticalPriority.high() = _High;
  const factory TacticalPriority.highest() = _highest;
  @override
  int compareTo(TacticalPriority other) {
    return value.compareTo(other.value);
  }
}

extension TacticalPriorityValue on TacticalPriority {
  bool operator <(TacticalPriority other) => compareTo(other) < 0;
  bool operator <=(TacticalPriority other) => compareTo(other) <= 0;
  bool operator >(TacticalPriority other) => compareTo(other) > 0;
  bool operator >=(TacticalPriority other) => compareTo(other) >= 0;
  int get value {
    return when(
      low: () => 10,
      medium: () => 50,
      high: () => 100,
      highest: () => 200,
    );
  }
}
