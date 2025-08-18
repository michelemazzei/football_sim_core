// lib/commands/command.dart

enum CommandType { stopBall, passTo }

class Command {
  final CommandType type;
  final Map<String, dynamic> data;
  Command(this.type, [this.data = const {}]);
  static Command stopBall() => Command(CommandType.stopBall);
}
