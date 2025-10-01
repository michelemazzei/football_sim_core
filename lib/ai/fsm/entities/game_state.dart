import 'package:flutter/foundation.dart';
import 'package:football_sim_core/ai/fsm/messaging/telegram.dart';
import 'package:football_sim_core/ecs/ecs_world.dart';
import 'package:football_sim_core/ecs/entities/ecs_entity.dart';
import 'package:logging/logging.dart';

abstract class GameState<EntityType extends EcsEntity> {
  final _logger = Logger('GameState');
  GameState();

  @nonVirtual
  void enter(EntityType entity, EcsWorld world) {
    _logger.info('⮕  $runtimeType - ${entity.runtimeType}-${entity.id}');
    doEnter(entity, world);
  }

  @nonVirtual
  void execute(EntityType entity, double dt, EcsWorld world) {
    doExecute(entity, dt, world);
  }

  @nonVirtual
  void exit(EntityType entity, EcsWorld world) {
    _logger.info('⮌  $runtimeType - ${entity.runtimeType}-${entity.id}');
    doExit(entity, world);
  }

  void doEnter(EntityType entity, EcsWorld world) {}

  void doExecute(EntityType entity, double dt, EcsWorld world) {}

  void doExit(EntityType entity, EcsWorld world) {}
  @nonVirtual
  bool onMessage(EntityType entity, Telegram telegram, EcsWorld world) {
    _logger.info(
      ' Received message: ${telegram.message} for Entity: ${entity.id}',
    );
    return handleMessage(entity, telegram, world);
  }

  bool handleMessage(EntityType entity, Telegram telegram, EcsWorld world) =>
      false;
  @override
  String toString() => runtimeType.toString();
}
