import 'package:football_sim_core/core/tactics/bricks/tactical_brick.dart';
import 'package:football_sim_core/core/tactics/tactics_names.dart';

class TacticalRegistry {
  static final Map<TacticsName, TacticalBrick> _registry = {};

  static void register(TacticalBrick brick) {
    _registry[brick.id] = brick;
  }

  static TacticalBrick? get(TacticsName id) => _registry[id];
}
