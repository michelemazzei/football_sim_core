import 'package:flame/components.dart';
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

  // Da aggiungere a PerceptionModule
  bool isPassLineClear(
    Vector2 start,
    Vector2 end,
    List<PlayerEntity> opponents, {
    double laneWidth = 0.05,
  }) {
    for (var opp in opponents) {
      // Calcoliamo la distanza del difensore dal segmento start-end
      // Se la distanza è inferiore a laneWidth, il passaggio è a rischio intercettazione
      double dist = _distToSegment(opp.position, start, end);
      if (dist < laneWidth) return false;
    }
    return true;
  }

  double _distToSegment(Vector2 p, Vector2 v, Vector2 w) {
    double l2 = v.distanceToSquared(w);
    if (l2 == 0) return p.distanceTo(v);
    double t = ((p.x - v.x) * (w.x - v.x) + (p.y - v.y) * (w.y - v.y)) / l2;
    t = t.clamp(0.0, 1.0);
    return p.distanceTo(Vector2(v.x + t * (w.x - v.x), v.y + t * (w.y - v.y)));
  }
}
