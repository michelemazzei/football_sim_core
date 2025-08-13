import 'package:football_sim_core/ecs/components/ecs_component.dart';
import 'package:football_sim_core/match/ecs_match.dart'; // o dove hai definito Match

class MatchComponent extends EcsComponent {
  final EcsMatch match;

  MatchComponent(this.match);
}
