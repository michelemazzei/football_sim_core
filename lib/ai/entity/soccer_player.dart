import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flame/components.dart';
import 'package:football_sim_core/ai/common/transformations.dart';
import 'package:football_sim_core/ai/config/soccer_parameters.dart';
import 'package:football_sim_core/ai/entity/soccer_behaviors.dart';
import 'package:football_sim_core/ai/entity/soccer_player.dart';
import 'package:football_sim_core/ai/fsm/state_machine.dart';
import 'package:football_sim_core/ai/moving_entity.dart';
import 'package:football_sim_core/ai/msg/telegram.dart';
import 'package:football_sim_core/ai/steering/steering_behaviors.dart';

class SoccerPlayer extends MovingEntity {
  final int number;
  final PlayerAttributes attr;
  final PlayerFeatures feat;
  late MatchPosition matchPosition;
  late final StateMachine<SoccerPlayer> stateMachine;
  final SoccerTeam team;
  late final SoccerBehaviors behaviors;
  Vector2 get homePosition => matchPosition.position;
  SoccerPitch get soccerPitch => team.game.soccerPitch;
  SoccerGame get game => team.game;
  Region? get region => soccerPitch.regions[matchPosition.regionId];
  Region get currentRegion => soccerPitch.getRegionByPosition(currentPosition);
  String get name => attr.name;
  String get surname => attr.surname;
  String get nameAndSurname => '$name $surname';
  int get age => attr.age;
  PitchPosition get playerPosition => matchPosition.tacticePos;
  Vector2? lastSteering;
  int lastSteeringTime = 0;
  SoccerPlayer({
    required this.team,
    required this.number,
    Vector2? position,
    MatchPosition? matchPosition,
    required super.uuid,
    required this.attr,
    required this.feat,
  }) : super(
         heading: Vector2.zero(),
         currentVelocity: Vector2.zero(),
         currentPosition: position ?? Vector2.zero(),
         maxSpeed: SoccerParameters.playerMaxSpeedWithoutBall,
         panicDistance: SoccerParameters.playerPanicDistance,
         mass: SoccerParameters.playerMass,
       ) {
    this.matchPosition =
        matchPosition ??
        MatchPosition(
          preferred: 0,
          regions: <Region>[],
          tacticePos: attr.position.copyWith(),
        );
    behaviors = SoccerBehaviors(this);
    stateMachine = StateMachine<SoccerPlayer>(
      this,
      globalState: GlobalPlayerState(),
    );
  }
  @override
  String toString() => nameAndSurname;

  bool get isBallOwner => team.game.soccerBall.owner?.uuid == uuid;

  bool positionInFrontOfPlayer(Vector2 position) {
    var toSubject = position - currentPosition;
    return toSubject.dot(heading) > 0;
  }

  bool isThreatened() {
    for (var opponent in team.opponentTeam.players) {
      if (positionInFrontOfPlayer(opponent.currentPosition) &&
          (currentPosition - opponent.currentPosition).length2 <
              SoccerParameters.playerComfortZone) {
        return true;
      }
    }
    return false;
  }

  bool isNear(Vector2 position) =>
      (currentPosition - position).length2 <
      (SoccerParameters.ballRadius * 1.3 * SoccerParameters.ballRadius * 1.3);

  void trackBall() {
    heading = (game.ball.ball.currentPosition - currentPosition).normalized();
  }

  @override
  void update(double dt) {
    behaviors.update(dt);
    super.update(dt);
    stateMachine.update();
  }

  List<SoccerPlayer> passSafeFromAllOpponents(Vector2 target) {
    var obstacles = <SoccerPlayer>[];
    var distance = (target - currentPosition).length2;
    var toTarget = (target - currentPosition).normalized();
    for (var obstacle in team.opponentTeam.players) {
      var localPosition = Transformations.pointToLocalSpace(
        obstacle.currentPosition,
        toTarget,
        toTarget.scaleOrthogonalInto(-1, Vector2.zero()),
        currentPosition,
      );
      if (localPosition.x > 0 && localPosition.length2 < distance) {
        obstacles.add(obstacle);
      }
    }
    return obstacles;
  }

  bool isTeammate(SoccerPlayer p) => p.team.color == team.color;

  SoccerPlayer nearestPlayer(Vector2 target) {
    var distance = double.maxFinite;
    SoccerPlayer nearest = this;
    for (var p in [...team.opponentTeam.players, ...team.players]) {
      var length2 = (p.currentPosition - target).length2;
      if (length2 < distance) {
        distance = length2;
        nearest = p;
      }
    }
    return nearest;
  }

  @override
  bool handleMessage(Telegram telegram) => stateMachine.handleMessage(telegram);
}
