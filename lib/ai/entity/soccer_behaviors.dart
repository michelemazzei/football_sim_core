import 'package:flame/components.dart';
import 'package:football_sim_core/ai/entity/soccer_player.dart';
import 'package:football_sim_core/ai/steering/steering_behaviors.dart';

class SoccerBehaviors {
  // final log = logFactory('Beahviors');
  final SoccerPlayer player;
  final SteeringBehaviors behaviors;

  SoccerBehaviors(this.player) : behaviors = SteeringBehaviors(player);

  bool _arrive = false;
  Vector2 _destination = Vector2.zero();

  void arrive(Vector2 destination) {
    _arrive = true;
    _destination = destination;
  }

  List<SoccerPlayer> neighbors() {
    return <SoccerPlayer>[...player.team.players]
      ..sort((a, b) {
        return ((a.currentPosition - player.currentPosition).length2 -
                (b.currentPosition - player.currentPosition).length2)
            .toInt();
      })
      ..removeAt(0);
  }

  void update(double dt) {
    if (_arrive) {
      if (player.isNear(_destination)) {
        _arrive = false;
        player.setVelocity(Vector2.zero());
      } else {
        var vel = behaviors.arrive(_destination);
        var myTeammates = player.team.players
            .map((e) => e.currentPosition)
            .toList();
        var myOpponents = player.team.opponentTeam.players
            .map((e) => e.currentPosition)
            .toList();
        Vector2? steering = player.lastSteering;
        var now = DateTime.now().millisecondsSinceEpoch;
        var lastTime = player.lastSteeringTime;
        if (now - lastTime > 150) {
          steering = behaviors.obstacleAvoidance([
            ...myTeammates,
            ...myOpponents,
          ]);
          player.lastSteering = steering;
          player.lastSteeringTime = now;
        }
        player.setVelocity(vel + steering!);
      }
    }
  }
}
