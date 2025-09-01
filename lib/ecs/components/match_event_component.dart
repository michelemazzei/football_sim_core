import 'package:football_sim_core/ecs/components/ecs_component.dart';

enum MatchEvent {
  startPlay,
  pause,
  goalScored,
  endMatch,
  // aggiungi altri eventi se servono
}

class MatchEventComponent extends EcsComponent {
  final MatchEvent event;
  MatchEventComponent(this.event);
}
