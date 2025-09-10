// lib/components/render_component.dart

import 'package:flame/components.dart';
import 'package:football_sim_core/ecs/components/ecs_component.dart';

/// Attacca questo component a un'entità per dirgli
/// “usa questo Positionable/Flame component per il rendering”
class RenderComponent extends EcsComponent {
  final int entityId;
  PositionComponent component;

  RenderComponent({required this.entityId, required this.component});
}
