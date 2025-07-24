import 'package:helloflame/ai/fsm/state.dart';
import 'package:helloflame/ai/soccer_player.dart';
import 'package:helloflame/logger/logger.dart';

enum GoalkeeperState { attacking, defending }

class GoalkeeperStrategy extends State<SoccerPlayer> {
  final log = logFactory('🧤 Tactice');
  final GoalkeeperState state;

  GoalkeeperStrategy(this.state);
  @override
  void enter(SoccerPlayer entity) {
    switch (state) {
      case GoalkeeperState.attacking:
        log.i('enter goalkeeper attacking');
        //if the goalkeeper does not control the ball
        //go to home area.
        if (entity.team.controllingPlayer != entity) {
          entity.behaviors.arrive(entity.homePosition);
        }
        break;
      case GoalkeeperState.defending:
        log.i('enter goalkeeper defending');
        //if the goalkeeper does not control the ball
        //go to home area.
        if (entity.team.controllingPlayer != entity) {
          entity.behaviors.arrive(entity.homePosition);
        }
        break;
    }
  }

  @override
  void execute(SoccerPlayer entity) {}

  @override
  void exit(SoccerPlayer entity) {}
}
