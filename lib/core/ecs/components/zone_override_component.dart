import 'package:football_sim_core/core/field/zone.dart';
import 'package:football_sim_core/ecs/components/ecs_component.dart';

class ZoneOverrideComponent extends EcsComponent {
  final List<Zone> overrideZones = List<Zone>.empty(
    growable: true,
  ); // per ruoli che coprono più zone (es. portiere)

  ZoneOverrideComponent({Zone? alternative, List<Zone>? alternatives}) {
    if (alternative != null) overrideZones.add(alternative);
    if ((alternatives?.length ?? 0) > 0) {
      overrideZones.addAll(alternatives ?? []);
    }
  }
}
