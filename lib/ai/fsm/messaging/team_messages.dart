// lib/messages/team_messages.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'message.dart';

part 'team_messages.freezed.dart';

@freezed
sealed class TeamMessage with _$TeamMessage implements Message {
  const factory TeamMessage.attacking() = Attacking;
  const factory TeamMessage.defending() = Defending;
}
