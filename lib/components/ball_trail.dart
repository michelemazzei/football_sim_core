// lib/components/ball_trail.dart
import 'package:flame/components.dart';
import 'package:flame/particles.dart';
import 'package:flutter/material.dart';
import '../game/football_game.dart';

class BallTrail extends ParticleSystemComponent
    with HasGameReference<FootballGame> {
  static final colors = [
    Colors.redAccent,
    Colors.orangeAccent,
    Colors.yellowAccent,
    Colors.greenAccent,
    Colors.cyanAccent,
    Colors.blueAccent,
    Colors.purpleAccent,
  ];

  BallTrail(Vector2 spawnPosition)
    : super(
        position: spawnPosition,
        anchor: Anchor.center,
        particle: Particle.generate(
          count: 4,
          lifespan: 0.4,
          generator: (i) => AcceleratedParticle(
            speed: (Vector2.random() - Vector2.all(0.5)) * 80,
            acceleration: Vector2(0, 150),
            child: CircleParticle(
              radius: 3,
              paint: Paint()..color = colors[i % colors.length],
            ),
          ),
        ),
      );
}
