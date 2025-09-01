import 'package:football_sim_core/ecs/components/ecs_component.dart';

enum MatchPhase {
  kickoff,
  play,
  goal,
  pause,
  endFirstHalf,
  startSecondHalf,
  startFirstExtended,
  endFirstExtended,
  startSecondExtended,
  endSecondExtended,
  startShootOut,
  endShootOut,
  finished,
}

class MatchStateComponent extends EcsComponent {
  MatchPhase phase;

  MatchStateComponent(this.phase);
}
