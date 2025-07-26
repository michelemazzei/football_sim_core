import 'package:flame/components.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

import 'package:football_sim_core/ai/pitch/playground.dart';

class PlaygroundReader {
  final String currentPlayground;
  PlaygroundReader(this.currentPlayground);

  Playground? playground;

  Future<dynamic> readJson() async {
    final String response = await rootBundle.loadString(currentPlayground);
    return await json.decode(response);
  }

  Future<Playground> readPlayGround() async {
    var data = await readJson();
    var ul = Vector2(
      (data['soccer_pitch']['UL']['x']).toDouble(),
      data['soccer_pitch']['UL']['y'].toDouble(),
    );
    var br = Vector2(
      data['soccer_pitch']['BR']['x'].toDouble(),
      data['soccer_pitch']['BR']['y'].toDouble(),
    );
    var centerSpot = Vector2(
      data['center_spot']['x'].toDouble(),
      data['center_spot']['y'].toDouble(),
    );
    var leftGoalBottom = Vector2(
      data['left_goal']['B']['x'].toDouble(),
      data['left_goal']['B']['y'].toDouble(),
    );
    var leftGoalUpper = Vector2(
      data['left_goal']['U']['x'].toDouble(),
      data['left_goal']['U']['y'].toDouble(),
    );
    var rightGoalBottom = Vector2(
      data['right_goal']['B']['x'].toDouble(),
      data['right_goal']['B']['y'].toDouble(),
    );
    var rightGoalUpper = Vector2(
      data['right_goal']['U']['x'].toDouble(),
      data['right_goal']['U']['y'].toDouble(),
    );
    var leftPenalty = Vector2(
      data['left_penalty']['x'].toDouble(),
      data['left_penalty']['y'].toDouble(),
    );
    var rightPenalty = Vector2(
      data['right_penalty']['x'].toDouble(),
      data['right_penalty']['y'].toDouble(),
    );

    playground = Playground(
      ul: ul,
      br: br,
      centerSpot: centerSpot,
      leftGoalBottom: leftGoalBottom,
      leftGoalUpper: leftGoalUpper,
      rightGoalBottom: rightGoalBottom,
      rightGoalUpper: rightGoalUpper,
      leftPenalty: leftPenalty,
      rightPenalty: rightPenalty,
    );
    return playground!;
  }
}
