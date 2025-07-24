import 'package:flame/components.dart';
import 'package:flame/components.dart';
import 'package:flame/components.dart';
import 'package:football_sim_core/ai/config/soccer_parameters.dart';
import 'package:football_sim_core/ai/entity/soccer_ball.dart';
import 'package:football_sim_core/ai/entity/soccer_player.dart';
import 'package:football_sim_core/ai/entity/soccer_referee.dart';
import 'package:football_sim_core/ai/entity/soccer_team.dart';
import 'package:football_sim_core/ai/entity/team_color.dart';
import 'package:football_sim_core/ai/entity/team_direction.dart';
import 'package:football_sim_core/ai/fsm/player/player_attack.dart';
import 'package:football_sim_core/ai/fsm/state.dart';
import 'package:football_sim_core/ai/fsm/state_machine.dart';
import 'package:football_sim_core/ai/fsm/team/defending_state.dart';
import 'package:football_sim_core/ai/fsm/team/prepare_for_kick_off_state.dart';
import 'package:football_sim_core/ai/moving_entity.dart';
import 'package:football_sim_core/ai/msg/message_dispatcher.dart';
import 'package:football_sim_core/ai/msg/message_receiver.dart';
import 'package:football_sim_core/ai/msg/messages.dart';
import 'package:football_sim_core/ai/msg/telegram.dart';
import 'package:football_sim_core/ai/steering/steering_behaviors.dart';

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
