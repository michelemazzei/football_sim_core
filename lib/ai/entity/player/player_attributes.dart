import 'package:football_sim_core/ai/pitch/pitch_position.dart';

class PlayerAttributes {
  final PitchPosition position;
  final String name;
  final String surname;
  final int age;
  PlayerAttributes({
    required this.position,
    required this.name,
    required this.surname,
    required this.age,
  });

  PlayerAttributes copyWith({
    PitchPosition? position,
    String? name,
    String? surname,
    int? age,
  }) {
    return PlayerAttributes(
      position: position ?? this.position,
      name: name ?? this.name,
      surname: surname ?? this.surname,
      age: age ?? this.age,
    );
  }

  @override
  String toString() {
    return 'PlayerAttributes(position: $position, name: $name, surname: $surname, age: $age)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PlayerAttributes &&
        other.position == position &&
        other.name == name &&
        other.surname == surname &&
        other.age == age;
  }

  @override
  int get hashCode {
    return position.hashCode ^ name.hashCode ^ surname.hashCode ^ age.hashCode;
  }
}
