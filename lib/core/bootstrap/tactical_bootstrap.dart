import 'package:football_sim_core/core/bricks/zone_tactical_brick.dart';
import 'package:football_sim_core/core/tactics/tactical_registry.dart';

class TacticalBootstrap {
  static void registerAllTacticalBricks() {
    TacticalRegistry.register(ZoneTacticBrick());
    // TacticalRegistry.register(HighPressingBrick());
    // TacticalRegistry.register(BuildUpBrick());
    // ecc.
  }
}
