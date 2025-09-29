import 'package:football_sim_core/ecs/components/ecs_components.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:football_sim_core/core/tactics/tactical_roles.dart';

part 'tactical_role_component.freezed.dart';

@freezed
abstract class TacticalRoleComponent
    with _$TacticalRoleComponent
    implements EcsComponent {
  const factory TacticalRoleComponent({required TacticalRole role}) =
      _TacticalRoleComponent;
}
