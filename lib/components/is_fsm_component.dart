import 'package:football_sim_core/ai/fsm/messaging/telegram.dart';
import 'package:football_sim_core/ecs/components/ecs_component.dart';

abstract class IsFsmComponent extends EcsComponent {
  bool handleMessage(Telegram telegram);
}
