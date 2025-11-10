import 'package:football_sim_core/core/tactics/player_tactics/ball_follow_tactic.dart';
import 'package:football_sim_core/core/tactics/player_tactics/cover_assigned_zone_tactic.dart';
import 'package:football_sim_core/core/tactics/player_tactics/player_tactic.dart';
import 'package:football_sim_core/core/tactics/tactics_names.dart';

class PlayerTacticRegistry {
  static Map<TacticsName, PlayerTactic> getDefaultTactics() => {
    TacticsName.zoneTactic(): CoverAssignedZoneTactic(),
    TacticsName.ballFollowTactic(): BallFollowTactic(),
  };
}
