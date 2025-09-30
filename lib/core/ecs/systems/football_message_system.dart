import 'package:football_sim_core/ai/fsm/messaging/messaging.dart';
import 'package:football_sim_core/core/ecs/messages/tactic_messages.dart';
import 'package:football_sim_core/core/field/zone.dart';
import 'package:football_sim_core/ecs/components/ecs_components.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/ecs/systems/ecs_system.dart';
import 'package:logging/logging.dart';

class FootballMessageSystem extends EcsSystem {
  final logger = Logger('core.ecs.systems.FootballMessageSystem');
  @override
  void update(EcsWorld world, double dt) {
    final sender = world.getResource<MessageSenderComponent>()?.dispatcher;
    if (sender == null) return;
    sender.consume<TacticMessage>(
      discharge: (Telegram telegram) {
        Message message = telegram.message;
        if (message is TacticMessage) {
          message.mapOrNull(
                moveToZone: (m) {
                  final target = m.targetZone.center;
                  sender.dispatchMessage(
                    sender: telegram.sender,
                    receiver: telegram.receiver,
                    message: MoveToPosition(target),
                  );
                  m.onAck?.call();
                },
                // Altri messaggi tattici (es. markOpponent, coverZone) qui sotto
              ) ??
              logger.warning(
                '⚠️ Unhandled TacticMessage: ${message.runtimeType}',
              );
        }
      },
    );
  }
}
