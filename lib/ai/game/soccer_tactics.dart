import 'package:football_sim_core/ai/entity/soccer_player.dart';
import 'package:football_sim_core/ai/entity/soccer_team.dart';
import 'package:football_sim_core/ai/entity/team_direction.dart';
import 'package:football_sim_core/ai/pitch/match_position.dart';
import 'package:football_sim_core/ai/pitch/pitch_position.dart';
import 'package:football_sim_core/ai/pitch/soccer_pitch.dart';

enum SoccerStrategy { t_442, t_451, t_352, t_532, t_4231 }

class SoccerTactics {
  // final log = logFactory('SoccerTactics');
  final int defenders;
  final int midfielders;
  final int attackingMidfielders;
  final int forwards;
  final SoccerPitch soccerPitch;

  SoccerTactics._(
    this.defenders,
    this.midfielders,
    this.attackingMidfielders,
    this.forwards,
    this.soccerPitch,
  );
  factory SoccerTactics.make(SoccerStrategy strategy, SoccerPitch soccerPitch) {
    switch (strategy) {
      case SoccerStrategy.t_442:
        return SoccerTactics._(4, 4, 0, 2, soccerPitch);
      case SoccerStrategy.t_451:
        return SoccerTactics._(4, 5, 0, 1, soccerPitch);
      case SoccerStrategy.t_352:
        return SoccerTactics._(3, 5, 0, 2, soccerPitch);
      case SoccerStrategy.t_532:
        return SoccerTactics._(5, 3, 0, 2, soccerPitch);
      case SoccerStrategy.t_4231:
        return SoccerTactics._(4, 2, 3, 1, soccerPitch);
    }
  }

  MatchPosition makePosition(SoccerPlayer player, TeamDirection direction) {
    var regions = soccerPitch
        .getRegions(player.attr.position, direction)
        .toList();
    return MatchPosition(
      regions: regions,
      preferred: (regions.length) ~/ 2,
      tacticePos: player.attr.position.copyWith(),
    );
  }

  void arrangePlayers(SoccerTeam team) {
    for (var player in team.players) {
      var playersInPos = _findInPosition(team, player.playerPosition);
      if (playersInPos.length > 1) {
        if (playersInPos.length == 2) {
          playersInPos[0].matchPosition.preferred = 0;
          playersInPos[1].matchPosition.preferred =
              playersInPos[1].matchPosition.regions.length - 1;
        } else {
          for (var counter = 0; counter < playersInPos.length; counter++) {
            playersInPos[counter].matchPosition.preferred = counter.clamp(
              0,
              playersInPos[counter].matchPosition.regions.length - 1,
            );
          }
        }
      } else if (playersInPos.isNotEmpty) {
        playersInPos.first.matchPosition.preferred =
            playersInPos.first.matchPosition.regions.length ~/ 2;
      }
    }
  }

  String _generalRole(PitchPosition role) => role.role.name + role.side.name;

  List<SoccerPlayer> _findInPosition(
    SoccerTeam team,
    PitchPosition tacticePos,
  ) {
    return team.players
        .where(
          (element) =>
              _generalRole(element.playerPosition) == _generalRole(tacticePos),
        )
        .toList();
  }
}
