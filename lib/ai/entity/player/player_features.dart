import 'dart:convert';

class PlayerFeatures {
  int pace;
  int shooting;
  int passing;
  int dribbling;
  int defending;
  int physical;
  int handling;
  PlayerFeatures({
    required this.pace,
    required this.shooting,
    required this.passing,
    required this.dribbling,
    required this.defending,
    required this.physical,
    required this.handling,
  });

  PlayerFeatures copyWith({
    int? pace,
    int? shooting,
    int? passing,
    int? dribbling,
    int? defending,
    int? physical,
    int? handling,
  }) {
    return PlayerFeatures(
      pace: pace ?? this.pace,
      shooting: shooting ?? this.shooting,
      passing: passing ?? this.passing,
      dribbling: dribbling ?? this.dribbling,
      defending: defending ?? this.defending,
      physical: physical ?? this.physical,
      handling: handling ?? this.handling,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'pace': pace,
      'shooting': shooting,
      'passing': passing,
      'dribbling': dribbling,
      'defending': defending,
      'physical': physical,
      'handling': handling,
    };
  }

  factory PlayerFeatures.fromMap(Map<String, dynamic> map) {
    return PlayerFeatures(
      pace: map['pace']?.toInt() ?? 0,
      shooting: map['shooting']?.toInt() ?? 0,
      passing: map['passing']?.toInt() ?? 0,
      dribbling: map['dribbling']?.toInt() ?? 0,
      defending: map['defending']?.toInt() ?? 0,
      physical: map['physical']?.toInt() ?? 0,
      handling: map['handling']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory PlayerFeatures.fromJson(String source) =>
      PlayerFeatures.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PlayerFeatures(pace: $pace, shooting: $shooting, passing: $passing, dribbling: $dribbling, defending: $defending, physical: $physical, handling: $handling)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PlayerFeatures &&
        other.pace == pace &&
        other.shooting == shooting &&
        other.passing == passing &&
        other.dribbling == dribbling &&
        other.defending == defending &&
        other.physical == physical &&
        other.handling == handling;
  }

  @override
  int get hashCode {
    return pace.hashCode ^
        shooting.hashCode ^
        passing.hashCode ^
        dribbling.hashCode ^
        defending.hashCode ^
        physical.hashCode ^
        handling.hashCode;
  }
}
