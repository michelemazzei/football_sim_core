import 'package:flutter/material.dart';

enum TeamId {
  red,
  blue;

  TeamId get opponent => switch (this) {
    TeamId.red => TeamId.blue,
    TeamId.blue => TeamId.red,
  };

  String get displayName => switch (this) {
    TeamId.red => 'Red Team',
    TeamId.blue => 'Blue Team',
  };

  Color get color => switch (this) {
    TeamId.red => Colors.red,
    TeamId.blue => Colors.blue,
  };
}
