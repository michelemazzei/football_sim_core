import 'package:flame/components.dart';
import 'package:football_sim_core/ai/config/soccer_parameters.dart';
import 'package:football_sim_core/ai/fsm/entities/game_state.dart';
import 'package:football_sim_core/core/field/field_grid.dart';
import 'package:football_sim_core/core/field/zone.dart';
import 'package:football_sim_core/ecs/components/ecs_components.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/ecs/entities/player_entity.dart';
import 'package:football_sim_core/utils/coordinate_mapper.dart';
import 'package:logging/logging.dart';

class MoveToZoneState extends GameState<PlayerEntity> {
  final logger = Logger('MoveToZoneState');

  final Zone targetZone;

  MoveToZoneState({required this.targetZone});

  @override
  void doEnter(PlayerEntity entity, EcsWorld world) {
    final fieldGrid = world.getResource<FieldGrid>();
    if (fieldGrid == null) {
      return;
    }
    final mapper = world.getResource<CoordinateMapper>();
    if (mapper == null) return;

    final center = fieldGrid.centerOfZone(targetZone);
    entity.addOrReplaceComponent(
      MovingComponent(
        mass: SoccerParameters.playerMass,
        heading: (center - entity.position).normalized(),
        currentPosition: entity.position,
        targetPosition: center,
        velocity: Vector2(10, 10),
      ),
    );
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
