import 'dart:math';
import 'package:flame/components.dart';
import 'package:flame/components.dart';
import 'package:flame/components.dart';
import 'package:football_sim_core/ai/config/soccer_parameters.dart';
import 'package:football_sim_core/ai/entity/soccer_ball.dart';
import 'package:football_sim_core/ai/entity/soccer_player.dart';
import 'package:football_sim_core/ai/entity/team_color.dart';
import 'package:football_sim_core/ai/entity/team_direction.dart';
import 'package:football_sim_core/ai/fsm/referee/kick_off_match_state.dart';
import 'package:football_sim_core/ai/fsm/state_machine.dart';
import 'package:football_sim_core/ai/moving_entity.dart';
import 'package:football_sim_core/ai/msg/message_dispatcher.dart';
import 'package:football_sim_core/ai/msg/message_receiver.dart';
import 'package:football_sim_core/ai/msg/messages.dart';
import 'package:football_sim_core/ai/msg/telegram.dart';
import 'package:football_sim_core/ai/steering/steering_behaviors.dart';
import 'package:flame/components.dart';
import 'package:flame/components.dart';
import 'package:football_sim_core/ai/config/soccer_parameters.dart';
import 'package:football_sim_core/ai/entity/soccer_ball.dart';
import 'package:football_sim_core/ai/entity/soccer_player.dart';
import 'package:football_sim_core/ai/entity/soccer_team.dart';
import 'package:football_sim_core/ai/fsm/state_machine.dart';
import 'package:football_sim_core/ai/moving_entity.dart';
import 'package:football_sim_core/ai/msg/message_receiver.dart';
import 'package:football_sim_core/ai/msg/telegram.dart';
import 'package:football_sim_core/ai/steering/steering_behaviors.dart';

class SoccerReferee extends MessageReceiver {
  late final StateMachine<SoccerReferee> stateMachine;
  final SoccerTeam home;
  final SoccerTeam away;
  final SoccerPitch pitch;
  final SoccerBall ball;
  SoccerReferee({
    required this.pitch,
    required this.ball,
    required this.home,
    required this.away,
  }) : super('Referee') {
    stateMachine = StateMachine(this);
  }

  void kickOff() {
    //Test Away starts match
    //    stateMachine.changeState(KickOffMatch(false));
    stateMachine.changeState(KickOffMatchState(Random.secure().nextBool()));
  }
}
