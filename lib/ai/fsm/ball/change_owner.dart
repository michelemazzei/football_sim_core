import 'package:football_sim_core/ai/entity/soccer_ball.dart';
import 'package:football_sim_core/ai/entity/soccer_player.dart';
import 'package:football_sim_core/ai/fsm/state.dart';
import 'package:football_sim_core/ai/msg/telegram.dart';

class ChangeOwnerState extends State<SoccerBall> {
  // final log = logFactory('⚽ Owner');
  final SoccerPlayer? owner;

  String get ownerName => owner?.name ?? '';

  ChangeOwnerState(this.owner);
  @override
  void enter(SoccerBall entity) {
    // log.i('new owner : ${owner?.toString() ?? 'none'}');
    entity.owner = owner;
    if (owner != null) {
      owner!.team.controllingPlayer = owner;
      owner!.team.opponentTeam.controllingPlayer = null;
    } else {
      owner!.team.controllingPlayer = null;
      owner!.team.opponentTeam.controllingPlayer = null;
    }
  }

  @override
  void execute(SoccerBall entity) {
    // TODO: implement execute
  }

  @override
  void exit(SoccerBall entity) {
    // TODO: implement exit
  }

  @override
  bool onMessage(SoccerBall entity, Telegram telegram) {
    return true;
  }

  @override
  String toString() {
    return '⚽ $ownerName ';
  }
}
