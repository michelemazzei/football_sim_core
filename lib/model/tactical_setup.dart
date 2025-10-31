// lib/messages/match_messages.dart

import 'package:football_sim_core/core/tactics/tactical_zone_builder.dart';
import 'package:football_sim_core/core/tactics/tactical_zone_map.dart';
import 'package:football_sim_core/model/formation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tactical_setup.freezed.dart';

@freezed
sealed class TacticalSetup with _$TacticalSetup {
  const factory TacticalSetup.formation442({
    required Formation formation,
    required TacticalZoneMap map,
  }) = _442;
  const factory TacticalSetup.formation433({
    required Formation formation,
    required TacticalZoneMap map,
  }) = _433;
}

TacticalSetup tacticalSetup442() => TacticalSetup.formation442(
  formation: formation442,
  map: TacticalZoneBuilder.tacticalZoneMap442,
);
TacticalSetup tacticalSetup433() => TacticalSetup.formation433(
  formation: formation433,
  map: TacticalZoneBuilder.tacticalZoneMap433,
);
