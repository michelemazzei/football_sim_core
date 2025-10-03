import 'package:flutter/material.dart';
import 'package:football_sim_core/model/team_id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'team.freezed.dart';

@freezed
sealed class Team with _$Team {
  factory Team({
    required TeamId id,
    required String name,
    required Color color,
  }) = _Team;
}
