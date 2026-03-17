import 'package:football_sim_core/model/team_id.dart';

class GoalEvent {
  final int minute;
  final TeamId teamId; // Il team a cui viene assegnato il punto (es. 1 o 2)
  final int scorerId; // Chi ha calciato/toccato per ultimo
  final int? assistantId; // Chi ha fatto il passaggio (null se non c'è assist)
  final bool isOwnGoal; // Flag esplicito

  // Questi sono i dati "grezzi" che hai messo tu, utili per l'analisi
  final TeamId? assistantTeamId;

  GoalEvent({
    required this.minute,
    required this.teamId,
    required this.scorerId,
    this.assistantId,
    required this.isOwnGoal,
    required this.assistantTeamId,
  });
}
