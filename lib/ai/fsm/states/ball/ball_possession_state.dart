import 'package:football_sim_core/ai/config/soccer_parameters.dart';
import 'package:football_sim_core/ai/fsm/states/ball/ball_base_state.dart';
import 'package:football_sim_core/ecs/components/ball_possession_component.dart';
import 'package:football_sim_core/ecs/components/ecs_components.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/ecs/entities/ball_entity.dart';
import 'package:football_sim_core/ecs/entities/player_entity.dart';
import 'package:logging/logging.dart';

class BallPossessionState extends BallBaseState {
  final logger = Logger('states.ball.BallPossessionState');
  final PlayerEntity owner;
  PlayerEntity? _lastOwner;

  BallPossessionState({required this.owner});

  PlayerEntity _getOwner(BallEntity entity, EcsWorld world) {
    var possession = entity.getComponent<BallPossessionComponent>();
    if (possession == null) {
      possession = BallPossessionComponent(
        teamId: owner.teamId,
        playerId: owner.id,
      );
      entity.addOrReplaceComponent(possession);
    }

    final player = world.entitiesOf<PlayerEntity>().firstWhere(
      (player) => player.id == possession!.playerId,
    );

    if (_lastOwner?.id != player.id) {
      logger.info('Ball possessed by Player ${player.number}-${player.teamId}');
      _lastOwner = player;
    }
    return player;
  }

  @override
  void doExecute(BallEntity entity, double dt, EcsWorld world) {
    final player = _getOwner(entity, world);

    final playerPos = player.position;
    final head = player.head;

    // Posiziona la palla leggermente davanti al giocatore
    final offset = head.normalized() * SoccerParameters.ballOffsetFromFeet;
    final ballPos = playerPos + offset;

    entity.addOrReplaceComponent(
      MovingComponent(
        maxSpeed: SoccerParameters.ballMaxSpeed,
        mass: SoccerParameters.ballMass,
        heading: head,
        currentPosition: ballPos,
      ),
    );
  }
}
