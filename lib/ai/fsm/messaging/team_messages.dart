import 'message.dart';

enum TeamMessage implements Message {
  attacking('TEAM_ATTACK'),
  defending('TEAM_DEFENSE');

  final String code;
  const TeamMessage(this.code);

  @override
  String toString() => code;
}
