import 'package:flame/components.dart';
import 'package:flame/components.dart';
import 'package:flame/components.dart';
import 'package:football_sim_core/ai/config/soccer_parameters.dart';
import 'package:football_sim_core/ai/entity/soccer_ball.dart';
import 'package:football_sim_core/ai/entity/soccer_player.dart';
import 'package:football_sim_core/ai/entity/team_color.dart';
import 'package:football_sim_core/ai/entity/team_direction.dart';
import 'package:football_sim_core/ai/fsm/state_machine.dart';
import 'package:football_sim_core/ai/moving_entity.dart';
import 'package:football_sim_core/ai/msg/message_dispatcher.dart';
import 'package:football_sim_core/ai/msg/message_receiver.dart';
import 'package:football_sim_core/ai/msg/messages.dart';
import 'package:football_sim_core/ai/msg/telegram.dart';
import 'package:football_sim_core/ai/steering/steering_behaviors.dart';

class SoccerTeam extends MessageReceiver {
  // final logger = logFactory('SoccerTeam');
  late final StateMachine<SoccerTeam> stateMachine;
  final TeamColor color;
  TeamDirection direction;
  final String name;
  final List<SoccerPlayer> players = <SoccerPlayer>[];
  final List<SoccerPlayer> substitutions = <SoccerPlayer>[];
  final List<SoccerPlayer> substituted = <SoccerPlayer>[];
  SoccerPlayer? controllingPlayer;
  SoccerPlayer? supportingPlayer;
  SoccerPlayer? receivingPlayer;
  SoccerPlayer? playerClosestToBall;
  double distToBallClosestPlayer = 0.0;
  final MessageDispatcher dispatcher;
  final SoccerGame game;
  SoccerTeam._(this.game, this.color, this.name, this.direction)
    : dispatcher = MessageDispatcher(),
      super('TEAM ${color.name}') {
    stateMachine = StateMachine(this);
  }

  SoccerTeam get opponentTeam => isHome ? game.awayTeam : game.homeTeam;

  factory SoccerTeam.createHome(
    SoccerGame game, {
    String name = 'HOME',
    bool fromLeft = true,
  }) => SoccerTeam._(
    game,
    TeamColor.home,
    name,
    fromLeft ? TeamDirection.fromLeftToRight : TeamDirection.fromRightToLeft,
  );
  factory SoccerTeam.createAway(
    SoccerGame game, {
    String name = 'AWAY',
    bool fromLeft = false,
  }) => SoccerTeam._(
    game,
    TeamColor.away,
    name,
    fromLeft ? TeamDirection.fromLeftToRight : TeamDirection.fromRightToLeft,
  );
  bool get isHome => color == TeamColor.home;
  bool get isAway => color == TeamColor.away;

  @override
  String toString() => name;

  bool inControl() => controllingPlayer != null;
  bool opponentInControl() => opponentTeam.controllingPlayer != null;
  void lostControl() {
    controllingPlayer = null;
  }

  SoccerPlayer calculateClosestPlayerToBall(SoccerBall ball) {
    var closestSoFar = double.maxFinite;
    var result = players.first;
    for (var player in players) {
      var dist = player.currentPosition.distanceToSquared(ball.currentPosition);
      if (dist < closestSoFar) {
        result = player;
        closestSoFar = dist;
      }
    }
    distToBallClosestPlayer = closestSoFar;
    return result;
  }

  /// Changes the state of all field players to that of ReturnToHomeRegion.
  /// Mainly used when a goal keeper has possession or kickoff.
  /// If  [placePlayerToKickOff] is true, then the last player is placed
  /// to the center of the pitch.
  void returnAllFieldPlayersToHome(bool placePlayerToKickOff) {
    logger.i('Return to home $placePlayerToKickOff');
    var numOfPlayers = placePlayerToKickOff
        ? players.length - 1
        : players.length;

    for (var counter = 0; counter < numOfPlayers; counter++) {
      var player = players[counter];
      dispatcher.dispatchMessage(
        sender: this,
        receiver: player,
        message: GoHome(),
      );
    }
    if (placePlayerToKickOff) {
      dispatcher.dispatchMessage(
        sender: this,
        receiver: players.last,
        message: PlaceToKickOff(),
      );
    }
  }

  bool isOpponentWithinRadius(Vector2 position, double radius) {
    for (var opponent in opponentTeam.players) {
      if ((opponent.currentPosition - position).length2 < radius * radius) {
        return true;
      }
    }
    return false;
  }

  @override
  bool handleMessage(Telegram telegram) => stateMachine.handleMessage(telegram);
}
