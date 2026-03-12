import 'package:football_sim_core/core/tactics/tactical_zone_builder.dart';
import 'package:football_sim_core/core/tactics/tactical_zone_map.dart';
import 'package:football_sim_core/model/formation.dart';

sealed class TacticalSetup {
  final Formation formation;
  final TacticalZoneMap map;

  const TacticalSetup({required this.formation, required this.map});
}

class TacticalSetup442 extends TacticalSetup {
  const TacticalSetup442({required super.formation, required super.map});
}

class TacticalSetup433 extends TacticalSetup {
  const TacticalSetup433({required super.formation, required super.map});
}

// Factory statiche per comodità (sostituiscono le vecchie funzioni libere)
TacticalSetup tacticalSetup442() => TacticalSetup442(
  formation: formation442,
  map: TacticalZoneBuilder.tacticalZoneMap442,
);

TacticalSetup tacticalSetup433() => TacticalSetup433(
  formation: formation433,
  map: TacticalZoneBuilder.tacticalZoneMap433,
);
