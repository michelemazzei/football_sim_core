import 'package:football_sim_core/ecs/components/ecs_component.dart';
import 'package:football_sim_core/game/football_game.dart';

class GameReferenceComponent extends EcsComponent {
  final FootballGame game;
  GameReferenceComponent(this.game);
}
