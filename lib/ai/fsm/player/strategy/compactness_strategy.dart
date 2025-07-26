import 'package:flame/components.dart';
import 'package:football_sim_core/ai/entity/soccer_player.dart';
import 'package:football_sim_core/ai/entity/team_direction.dart';
import 'package:football_sim_core/ai/fsm/player/wait_state.dart';
import 'package:football_sim_core/ai/fsm/state.dart';

enum CompactHorizontal { low, medium, high }

enum CompactVertical { low, medium, high }

class CompactnessStrategy extends State<SoccerPlayer> {
  // final log = logFactory('Compactness Strategy');
  final CompactHorizontal horizontal;
  final CompactVertical vertical;
  final double lowHorizontal = 0.8;
  final double mediumHorizontal = 0.7;
  final double highHorizontal = 0.6;
  final int lowVertical = -2;
  final int mediumVertical = 0;
  final int highVertical = 2;

  CompactnessStrategy({
    this.vertical = CompactVertical.medium,
    this.horizontal = CompactHorizontal.medium,
  });
  @override
  void enter(SoccerPlayer entity) {
    // log.i('enter defender ');
    if (entity.team.controllingPlayer != entity) {
      compactness(entity);
    }
  }

  void compactness(SoccerPlayer entity) {
    var pitch = entity.game.soccerPitch;
    var ball = entity.game.soccerBall;
    var ballInDanger = pitch.ballInDanger(
      ball.currentPosition,
      entity.team.direction,
    );
    if (!ballInDanger) {
      if (entity.matchPosition.isGoalkeeper) {
        if (entity.team.controllingPlayer != entity) {
          entity.behaviors.arrive(entity.homePosition);
        }
      } else {
        entity.behaviors.arrive(_findPosition(ball.currentPosition, entity));
      }
    }
  }

  Vector2 _findPosition(Vector2 ballPosition, SoccerPlayer entity) {
    var play = entity.game.soccerPitch.playground;
    var pitchLength = (play!.br.x - play.ul.x).abs();
    var y = entity.currentPosition.y;
    var distY = y - ballPosition.y;
    var coeff = mediumHorizontal;
    if (horizontal == CompactHorizontal.high) {
      coeff = highHorizontal;
    } else if (horizontal == CompactHorizontal.low) {
      coeff = lowHorizontal;
    }
    y = distY * coeff + ballPosition.y;
    int hCoeff = mediumVertical;
    if (vertical == CompactVertical.high) {
      hCoeff = highVertical;
    } else if (vertical == CompactVertical.low) {
      hCoeff = lowVertical;
    }
    var maxDist = entity.matchPosition.isDefenser
        ? pitchLength / (5 + hCoeff)
        : entity.matchPosition.isMidFielder
        ? pitchLength / (10 + hCoeff)
        : -pitchLength / (6 + hCoeff);
    if (entity.team.direction == TeamDirection.fromLeftToRight) {
      return Vector2(
        (ballPosition.x - maxDist).clamp(
          play.leftPenalty.x,
          entity.matchPosition.isDefenser
              ? play.centerSpot.x
              : play.rightPenalty.x,
        ),
        y,
      );
    } else {
      return Vector2(
        (ballPosition.x + maxDist).clamp(
          entity.matchPosition.isDefenser
              ? play.centerSpot.x
              : play.leftPenalty.x,
          play.rightPenalty.x,
        ),
        y,
      );
    }
  }

  @override
  void execute(SoccerPlayer entity) {
    if (entity.team.controllingPlayer == entity ||
        entity.team.controllingPlayer == null) {
      entity.stateMachine.changeState(WaitState());
    }
  }

  @override
  void exit(SoccerPlayer entity) {}
}
