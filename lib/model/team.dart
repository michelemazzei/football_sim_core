import 'package:flutter/material.dart';
import 'package:football_sim_core/model/team_id.dart';

class Team {
  final TeamId id;
  final String name;
  final Color color;

  const Team({required this.id, required this.name, required this.color});

  // Uguaglianza manuale (fondamentale per evitare bug nell'ECS)
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Team &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          color == other.color;

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ color.hashCode;

  /// Metodo copyWith manuale (se ti servisse cambiare il colore o il nome al volo)
  Team copyWith({TeamId? id, String? name, Color? color}) {
    return Team(
      id: id ?? this.id,
      name: name ?? this.name,
      color: color ?? this.color,
    );
  }

  @override
  String toString() => 'Team($name, ID: $id)';
}
