import 'package:football_sim_core/ai/entity/soccer_team.dart';
import 'package:football_sim_core/ai/fsm/player/player_attack.dart';
import 'package:football_sim_core/ai/fsm/state.dart';
import 'package:football_sim_core/ai/fsm/team/defending_state.dart';
import 'package:football_sim_core/ai/pitch/sweet_spot/pitch_spot_calculator.dart';

class AttackingState extends State<SoccerTeam> {
  PitchSpotCalculator? _bss;
  PitchSpotCalculator? _bbos;
  @override
  void enter(SoccerTeam entity) {
    // log.i('Enter Attacking');
    _bss = PitchSpotCalculator.bestSupportingSpot(entity);
    _bbos = PitchSpotCalculator.bestBallOwnerSpot(entity);
  }

  @override
  void execute(SoccerTeam entity) {
    if (entity.opponentInControl()) {
      entity.stateMachine.changeState(DefendingState());
    } else {
      for (var p in entity.players) {
        if (p.isBallOwner) {
          p.stateMachine.changeState(PlayerAttackState(_bbos!.spots));
        } else {
          p.stateMachine.changeState(PlayerAttackState(_bss!.spots));
        }
      }
    }
  }

  @override
  void exit(SoccerTeam entity) {}
}
