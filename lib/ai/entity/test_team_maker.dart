import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/components.dart';
import 'package:flame/components.dart';
import 'package:football_sim_core/ai/config/soccer_parameters.dart';
import 'package:football_sim_core/ai/entity/soccer_ball.dart';
import 'package:football_sim_core/ai/entity/soccer_player.dart';
import 'package:football_sim_core/ai/entity/soccer_team.dart';
import 'package:football_sim_core/ai/entity/team_color.dart';
import 'package:football_sim_core/ai/entity/team_direction.dart';
import 'package:football_sim_core/ai/fsm/state_machine.dart';
import 'package:football_sim_core/ai/moving_entity.dart';
import 'package:football_sim_core/ai/msg/message_dispatcher.dart';
import 'package:football_sim_core/ai/msg/message_receiver.dart';
import 'package:football_sim_core/ai/msg/messages.dart';
import 'package:football_sim_core/ai/msg/telegram.dart';
import 'package:football_sim_core/ai/steering/steering_behaviors.dart';
import 'package:uuid/uuid.dart';

class TestTeamMaker {
  final uuid = const Uuid();
  final age = 22;
  TestTeamMaker();

  List<SoccerPlayer> makePlayers(
    SoccerTeam team,
    int strength,
    int numberOfPlayers,
  ) {
    var players = makePlayers442(team, strength, numberOfPlayers);

    return players;
  }

  List<SoccerPlayer> makePlayers442(
    SoccerTeam team,
    int strength,
    int numberOfPlayers,
  ) {
    var players = <SoccerPlayer>[];
    for (var counter = 1; counter < numberOfPlayers + 1; counter++) {
      switch (counter) {
        case 1:
          players.add(
            makePlayer(
              counter,
              team,
              counter.toString(),
              strength,
              PitchPosition(role: PitchRole.gk),
            ),
          );
          break;
        case 2:
          players.add(
            makePlayer(
              counter,
              team,
              counter.toString(),
              strength,
              PitchPosition(role: PitchRole.d, side: PitchSide.l),
            ),
          );
          break;
        case 3:
          players.add(
            makePlayer(
              counter,
              team,
              counter.toString(),
              strength,
              PitchPosition(role: PitchRole.d, side: PitchSide.c),
            ),
          );
          break;
        case 4:
          players.add(
            makePlayer(
              counter,
              team,
              counter.toString(),
              strength,
              PitchPosition(role: PitchRole.d, side: PitchSide.c),
            ),
          );
          break;
        case 5:
          players.add(
            makePlayer(
              counter,
              team,
              counter.toString(),
              strength,
              PitchPosition(role: PitchRole.d, side: PitchSide.r),
            ),
          );
          break;
        case 6:
          players.add(
            makePlayer(
              counter,
              team,
              counter.toString(),
              strength,
              PitchPosition(role: PitchRole.m, side: PitchSide.l),
            ),
          );

          break;
        case 7:
          players.add(
            makePlayer(
              counter,
              team,
              counter.toString(),
              strength,
              PitchPosition(role: PitchRole.dm, side: PitchSide.c),
            ),
          );
          break;
        case 8:
          players.add(
            makePlayer(
              counter,
              team,
              counter.toString(),
              strength,
              PitchPosition(role: PitchRole.m, side: PitchSide.c),
            ),
          );
          break;
        case 9:
          players.add(
            makePlayer(
              counter,
              team,
              counter.toString(),
              strength,
              PitchPosition(role: PitchRole.m, side: PitchSide.r),
            ),
          );
          break;
        case 10:
          players.add(
            makePlayer(
              counter,
              team,
              counter.toString(),
              strength,
              PitchPosition(role: PitchRole.f, side: PitchSide.c),
            ),
          );
          break;
        case 11:
          players.add(
            makePlayer(
              counter,
              team,
              counter.toString(),
              strength,
              PitchPosition(role: PitchRole.f, side: PitchSide.c),
            ),
          );
          break;
      }
    }
    return players;
  }

  SoccerPlayer makePlayer(
    int number,
    SoccerTeam team,
    String surname,
    int strength,
    PitchPosition position,
  ) {
    var attr = PlayerAttributes(
      position: position,
      name: team.name,
      surname: surname,
      age: age,
    );
    var rand = Random.secure();
    rand.nextInt(20);
    var features = PlayerFeatures(
      pace: strength + rand.nextInt(20) - 10,
      shooting: strength + rand.nextInt(20) - 10,
      passing: strength + rand.nextInt(20) - 10,
      dribbling: strength + rand.nextInt(20) - 10,
      defending: strength + rand.nextInt(20) - 10,
      physical: strength + rand.nextInt(20) - 10,
      handling: position.role == PitchRole.gk
          ? strength + rand.nextInt(20) - 10
          : 0,
    );
    return SoccerPlayer(
      team: team,
      number: number,
      uuid: uuid.v1(),
      attr: attr,
      feat: features,
    );
  }
}
