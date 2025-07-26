import 'package:football_sim_core/ai/entity/soccer_ball.dart';
import 'package:football_sim_core/ai/entity/soccer_referee.dart';
import 'package:football_sim_core/ai/entity/soccer_team.dart';
import 'package:football_sim_core/ai/pitch/playground.dart';
import 'package:football_sim_core/ai/pitch/soccer_pitch.dart';
import 'package:football_sim_core/components/ball_component.dart';

class SoccerGame {
  // final log = logFactory('SoccerGame');
  late SoccerTeam homeTeam;
  late SoccerTeam awayTeam;
  // final SoccerPitch soccerPitch;
  late final SoccerReferee referee;
  // final homePlayers = <String, Player>{};
  // final awayPlayers = <String, Player>{};
  late final BallComponent ball;
  // final TestTeamMaker maker;

  // SoccerBall get soccerBall => ball.ball;
  // Player? getHomePlayer(String uuid) => homePlayers[uuid];
  // Player? getAwayPlayer(String uuid) => awayPlayers[uuid];

  SoccerGame({
    int homeStrength = 80,
    int awayStrength = 80,
    int numberOfPlayers = 11,
  });

  Future<void> initGame() async {
    // TODO: implement initGame
  }

  ///
  ///Updates the SFM of home and away teams.
  ///
  void update(double dt) {
    referee.stateMachine.update();
    homeTeam.stateMachine.update();
    awayTeam.stateMachine.update();
  }

  void _kickoff() {
    referee.kickOff();
  }
}
