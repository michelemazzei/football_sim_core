import 'package:football_sim_core/core/ecs/components/tactical_component.dart';
import 'package:football_sim_core/core/ecs/components/tactical_intents.dart';
import 'package:football_sim_core/core/ecs/components/tactical_setup_component.dart';
import 'package:football_sim_core/core/ecs/components/team_phase_component.dart';
import 'package:football_sim_core/core/ecs/components/team_tactic_queue_component.dart';
import 'package:football_sim_core/core/tactics/game_phases.dart';
import 'package:football_sim_core/core/tactics/tactics.dart';
import 'package:football_sim_core/core/tactics/tactics_names.dart';
import 'package:football_sim_core/ecs/components/ecs_components.dart';
import 'package:football_sim_core/ecs/components/team_side_component.dart';
import 'package:football_sim_core/ecs/entities/ecs_entity.dart';
import 'package:football_sim_core/model/tactical_setup.dart';
import 'package:football_sim_core/model/team.dart';
import 'package:football_sim_core/model/team_id.dart';

class TeamEntity extends EcsEntity {
  TeamEntity(
    super.id, {
    required Team team,
    required TacticalSetup tacticalSetup,
    TacticalIntent intent = const TacticalIntent.none(),
    List<Tactic> initialTactics = const [],
  }) {
    addComponent(TeamComponent(team));
    addComponent(TacticalSetupComponent(setup: tacticalSetup));
    addComponent(TeamPhaseComponent(GamePhase.buildUp()));
    addComponent(TacticalComponent());
    addComponent(TeamTacticQueueComponent());
  }

  @override
  String toString() => 'Team($id, ${getComponent<TeamComponent>()?.team.id})';

  TeamId get teamId => getComponent<TeamComponent>()!.team.id;
  bool get isLeftSide => getComponent<TeamSideComponent>()?.isLeftSide ?? true;
  bool get isRightSide =>
      getComponent<TeamSideComponent>()?.isRightSide ?? false;

  TacticalComponent get tactical => getComponent<TacticalComponent>()!;

  GamePhase? get gamePhase => getComponent<TeamPhaseComponent>()?.current;

  void activateTactic(TacticsName name) => tactical.activate(name);
  void deactivateTactic() => tactical.deactivate();
  void removeExpiredTactics() => tactical.removeExpiredTactics();
  Tactic? get activeTactic => tactical.activeTactic;
}
