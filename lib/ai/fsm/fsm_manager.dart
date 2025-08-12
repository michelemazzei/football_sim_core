import 'package:football_sim_core/ai/fsm/fsm.dart';
import 'package:football_sim_core/ai/fsm/messaging/telegram.dart';
import 'package:football_sim_core/ai/fsm/player_fsm.dart';
import 'package:football_sim_core/controllers/player_controller.dart';

abstract class FsmManager<EntityFsm extends Fsm<Controller>, Controller> {
  final Map<String, EntityFsm> _fsms = {};

  void register(Controller controller) {
    _fsms[controller.uuid] = EntityFsm(controller);
  }

  void updateAll() {
    for (final fsm in _fsms.values) {
      fsm.update();
    }
  }

  bool handleMessage(Telegram telegram) {
    final fsm = _fsms[telegram.receiver.uuid];
    return fsm?.handleMessage(telegram) ?? false;
  }
}
