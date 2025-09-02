import 'package:football_sim_core/model/team.dart';
import 'package:logging/logging.dart';

class EcsMatch {
  final logger = Logger('EcsMatch');

  /// Squadre (puoi definire una classe `Team`)
  final Team teamA;
  final Team teamB;

  EcsMatch({required this.teamA, required this.teamB});
}
