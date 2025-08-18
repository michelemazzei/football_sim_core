import 'package:football_sim_core/ecs/commands/command.dart';

class Ball {
  bool isInPossession = false;
  String? lastTouchedBy;
  final List<Command> commands = [];
  void addCommand(Command c) => commands.add(c);
}
