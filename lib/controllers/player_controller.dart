import 'package:football_sim_core/controllers/entity_controller.dart';

@Deprecated('use ECS system')
class PlayerController extends EntityController {
  PlayerController({
    required super.entity,
    required super.game,
    super.friction,
    super.maxSpeed,
  });

  @override
  void handleCollision() {
    // Per ora nessuna logica speciale
    // In futuro: gestione bordo campo, tackle, ecc.
  }
}
