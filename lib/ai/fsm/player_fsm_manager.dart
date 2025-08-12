import 'package:football_sim_core/ai/fsm/messaging/telegram.dart';
import 'package:football_sim_core/ai/fsm/player_fsm.dart';
import 'package:football_sim_core/controllers/player_controller.dart';

class PlayerFsmManager {
  final Map<String, PlayerFsm> _fsms = {};

  void register(PlayerController controller) {
    _fsms[controller.uuid] = PlayerFsm(controller);
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
