class EvaluatorConfig {
  final ShootConfig shoot;
  final PassConfig pass;
  final ClearanceConfig clearance;

  EvaluatorConfig({
    required this.shoot,
    required this.pass,
    required this.clearance,
  });

  factory EvaluatorConfig.fromJson(Map<String, dynamic> json) {
    return EvaluatorConfig(
      shoot: ShootConfig.fromJson(json['shoot']),
      pass: PassConfig.fromJson(json['pass_ground']),
      clearance: ClearanceConfig.fromJson(json['clearance']),
    );
  }
}

// Sotto-classe specifica per il tiro
class ShootConfig {
  final double maxDistance;
  final double minScore;
  final double maxScore;

  ShootConfig({
    required this.maxDistance,
    required this.minScore,
    required this.maxScore,
  });

  factory ShootConfig.fromJson(Map<String, dynamic> json) => ShootConfig(
    maxDistance: json['maxDistance']?.toDouble() ?? 0.35,
    minScore: json['minScore']?.toDouble() ?? 0.1,
    maxScore: json['maxScore']?.toDouble() ?? 0.95,
  );
}

class PassConfig {
  final double maxDistance;
  final double safetyThreshold;
  final double forwardBonus;

  PassConfig({
    required this.maxDistance,
    required this.safetyThreshold,
    required this.forwardBonus,
  });

  factory PassConfig.fromJson(Map<String, dynamic> json) => PassConfig(
    maxDistance: json['maxDistance']?.toDouble() ?? 0.5,
    safetyThreshold: json['safetyThreshold']?.toDouble() ?? 0.6,
    forwardBonus: json['forwardBonus']?.toDouble() ?? 1.2,
  );
}
