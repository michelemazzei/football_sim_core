import 'package:football_sim_core/ai/fsm/messaging/messaging.dart';
import 'package:football_sim_core/ecs/entities/ecs_entity.dart';

extension PlayerMessageTelegram on PlayerMessage {
  Telegram toTelegram({
    required EcsEntity sender,
    required EcsEntity receiver,
  }) {
    return TelegramUnion.immediate(
      sender: sender,
      receiver: receiver,
      message: this,
    );
  }
}
