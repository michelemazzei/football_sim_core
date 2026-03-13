import 'package:football_sim_core/ecs/entities/player_entity.dart';

class PerceptionModule {
  // Trova i K compagni più vicini
  List<PlayerEntity> getKNearestTeammates(
    PlayerEntity me,
    List<PlayerEntity> team,
    int k,
  ) {
    var neighbors = team.where((p) => p.id != me.id).toList();

    // Correzione: usa distanceToSquared()
    neighbors.sort(
      (a, b) => me.position
          .distanceToSquared(a.position)
          .compareTo(me.position.distanceToSquared(b.position)),
    );

    return neighbors.take(k).toList();
  }

  // Trova gli avversari entro un certo raggio (per la pressione)
  List<PlayerEntity> getOpponentsInRadius(
    PlayerEntity me,
    List<PlayerEntity> opponents,
    double radius,
  ) {
    // Correzione: usa distanceTo()
    return opponents
        .where((o) => me.position.distanceTo(o.position) < radius)
        .toList();
  }
}
