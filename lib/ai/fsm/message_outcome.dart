import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_outcome.freezed.dart';

@freezed
sealed class MessageOutcome with _$MessageOutcome {
  const factory MessageOutcome.consumed() = Consumed;
  const factory MessageOutcome.ignored() = Ignored;
  const factory MessageOutcome.escalated() = Escalated;
}
