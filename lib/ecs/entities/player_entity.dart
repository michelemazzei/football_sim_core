import 'package:collection/collection.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:football_sim_core/ai/config/soccer_parameters.dart';
import 'package:football_sim_core/ai/fsm/components/fsm.dart';
import 'package:football_sim_core/ai/fsm/components/player_fsm.dart';
import 'package:football_sim_core/ecs/components/cool_down_component.dart';
import 'package:football_sim_core/ecs/components/ecs_components.dart';
import 'package:football_sim_core/ecs/components/team_reference_component.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/ecs/entities/ecs_entity.dart';
import 'package:football_sim_core/ecs/entities/team_entity.dart';
import 'package:football_sim_core/game/football_game.dart';
import 'package:football_sim_core/model/team.dart';
import 'package:football_sim_core/model/team_id.dart';

class PlayerEntity extends EcsEntity {
  final EcsWorld world;

  /// Returns the [PlayerEntity] associated with this [EcsEntity].
  PlayerEntity(
    super.id,
    this.world, {
    required int number,
    required Color color,
    required FootballGame game,
    required Team team,
    required Vector2 initialPosition,
  }) {
    addComponent(EcsPlayerComponent())
    // Imposta il rapporto dimensionale (es. 5% della larghezza del campo)
    ;
    addComponent(const SizeRatioComponent(0.03));
    addComponent(PlayerColorComponent(color));
    addComponent(SizeComponent(height: 10.0, width: 10.0));
    addComponent(PlayerNumberComponent(number));
    addComponent(PlayerStateComponent(PlayerState.idle));
    addComponent(GameReferenceComponent(game));
    addComponent(TeamReferenceComponent(team.id));
    addComponent(PossessionComponent());
    addComponent(CooldownComponent());
    addComponent(
      MovingComponent(
        maxSpeed: SoccerParameters.playerMaxSpeed,
        heading: Vector2(1, 0),
        mass: SoccerParameters.playerMass,
        velocity: Vector2.zero(),
        currentPosition: Vector2(initialPosition.x, initialPosition.y),
      ),
    );

    /// FSM del match
    addComponent(FsmComponent<PlayerEntity>(PlayerFsm(this, world)));
  }

  @override
  String toString() =>
      'Player($id,  ${getComponent<TeamReferenceComponent>()?.teamId}, #${getComponent<PlayerNumberComponent>()?.number})';

  Fsm<PlayerEntity> get fsm => getComponent<FsmComponent<PlayerEntity>>()!.fsm;
  int get number => getComponent<PlayerNumberComponent>()!.number;
  TeamId get teamId => getComponent<TeamReferenceComponent>()!.teamId;
  Vector2 get position =>
      getComponent<MovingComponent>()?.currentPosition ?? Vector2.zero();
  Vector2 get head =>
      getComponent<MovingComponent>()?.heading ?? Vector2.zero();
  Vector2 get velocity =>
      getComponent<MovingComponent>()?.velocity ?? Vector2.zero();

  TeamEntity? getTeam() {
    final teamId = getComponent<TeamReferenceComponent>()?.teamId;
    if (teamId == null) return null;

    return world.entitiesOf<TeamEntity>().firstWhereOrNull(
      (team) => team.teamId == teamId,
    );
  }
}
