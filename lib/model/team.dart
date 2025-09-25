import 'package:flutter/material.dart';
import 'package:football_sim_core/ecs/entities/team_id.dart';

class Team {
  final TeamId id;
  final Color color;
  @override
  String toString() => 'Team(id: $id)';

  Team({required this.id, required this.color});
}
