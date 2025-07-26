import 'dart:math';

import 'package:football_sim_core/ai/entity/soccer_ball.dart';
import 'package:football_sim_core/ai/entity/soccer_team.dart';
import 'package:football_sim_core/ai/fsm/referee/kick_off_match_state.dart';
import 'package:football_sim_core/ai/fsm/state_machine.dart';
import 'package:football_sim_core/ai/msg/message_receiver.dart';

class SoccerReferee extends MessageReceiver {
  late final StateMachine<SoccerReferee> stateMachine;
  final SoccerTeam home;
  final SoccerTeam away;
  final SoccerBall ball;
  SoccerReferee({required this.ball, required this.home, required this.away})
    : super('Referee') {
    stateMachine = StateMachine(this);
  }

  void kickOff() {
    //Test Away starts match
    //    stateMachine.changeState(KickOffMatch(false));
    stateMachine.changeState(KickOffMatchState(Random.secure().nextBool()));
  }
}
