import 'package:football_sim_core/ecs/components/ecs_component.dart';
import 'package:football_sim_core/model/team_id.dart'; // o dove hai definito Match

class MatchComponent extends EcsComponent {
  final TeamId home;
  final TeamId away;
  int scoreHome = 0;
  int scoreAway = 0;
  int yellowCardsHome = 0;
  int yellowCardsAway = 0;
  int redCardsHome = 0;
  int redCardsAway = 0;
  int minute = 0;
  int aggregateScoreHome = 0; // per competizioni con andata e ritorno
  int aggregateScoreAway = 0; // per competizioni con andata e ritorno
  MatchComponent({required this.home, required this.away});
}
