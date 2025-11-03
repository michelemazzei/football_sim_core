import 'package:flame/components.dart';
import 'package:football_sim_core/ai/config/soccer_parameters.dart';
import 'package:football_sim_core/ai/fsm/entities/game_state.dart';
import 'package:football_sim_core/ai/fsm/states/player/move_to_position_state.dart';
import 'package:football_sim_core/core/field/field_grid.dart';
import 'package:football_sim_core/core/field/zone.dart';
import 'package:football_sim_core/ecs/components/ecs_components.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/ecs/entities/player_entity.dart';

class MoveToZoneState extends GameState<PlayerEntity> {
  final Zone targetZone;

  MoveToZoneState({required this.targetZone});

  @override
  void doEnter(PlayerEntity entity, EcsWorld world) {
    final field = world.getResource<FieldGrid>();
    if (field == null) {
      return;
    }
    final center = targetZone.centerPosition(
      fieldWidth: field.zoneWidth,
      fieldHeight: field.zoneHeight,
      maxX: FieldGrid.columns,
      maxY: FieldGrid.rows,
    );

    entity.addOrReplaceComponent(
      MovingComponent(
        mass: SoccerParameters.playerMass,
        heading: (center - entity.position).normalized(),
        currentPosition: entity.position,
        targetPosition: center,
        velocity: Vector2(10, 10),
      ),
    );
    entity.fsm.changeState(MoveToPositionState());
  }

  @override
  void doExecute(PlayerEntity entity, double dt, EcsWorld world) {
    // Non serve nulla qui: lo stato è solo transitorio
  }

  @override
  void doExit(PlayerEntity entity, EcsWorld world) {
    // Nessuna azione necessaria
  }
}
