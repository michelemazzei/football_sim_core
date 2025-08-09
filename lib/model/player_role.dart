import 'package:freezed_annotation/freezed_annotation.dart';

part 'player_role.freezed.dart';

@freezed
sealed class PlayerRole with _$PlayerRole {
  const PlayerRole._();

  const factory PlayerRole.goalkeeper() = Goalkeeper;
  const factory PlayerRole.defender() = Defender;
  const factory PlayerRole.midfielder() = Midfielder;
  const factory PlayerRole.attacker() = Attacker;

  @override
  String toString() {
    return switch (this) {
      Goalkeeper() => 'Goalkeeper',
      Defender() => 'Defender',
      Midfielder() => 'Midfielder',
      Attacker() => 'Attacker',
    };
  }
}
