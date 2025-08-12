import 'package:football_sim_core/components/ball_component.dart';
import 'package:football_sim_core/ecs/components/ball_logic_component.dart';
import 'package:football_sim_core/ecs/components/ecs_components.dart';
import 'package:football_sim_core/ecs/components/role_component.dart';
import 'package:football_sim_core/ecs/entities/entity.dart';
import 'package:football_sim_core/ecs/entities/team_id.dart';
import 'package:football_sim_core/model/team.dart';

class GameState {
  final Map<Entity, EntityPositionComponent> positionMap = {};
  final Map<Entity, VelocityComponent> velocityMap = {};
  final Map<Entity, MovementConfigComponent> movementConfigMap = {};
  final Map<Entity, SizeComponent> sizeMap = {};
  final Map<Entity, RoleComponent> roleMap = {};
  final Map<Entity, BallLogicComponent> ballLogicMap = {};
  final Map<TeamId, Team> teams = {};
  final Map<Entity, BallComponent> ballMap =
      {}; // Se usi logica specifica per la palla

  // Puoi aggiungere altri componenti qui (es. FSM, Role, Team, ecc.)
}
