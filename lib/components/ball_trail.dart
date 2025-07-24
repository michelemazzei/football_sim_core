// lib/components/ball_trail.dart
import 'package:flame/components.dart';
import 'package:flame/particles.dart';
import 'package:flutter/material.dart';
import '../game/football_game.dart';

class BallTrail extends ParticleSystemComponent
    with HasGameReference<FootballGame> {
  BallTrail(Vector2 spawnPosition)
    : super(
        position: spawnPosition,
        anchor: Anchor.center,
        particle: Particle.generate(
          count: 12, // più particelle
          lifespan: 0.7, // durano più a lungo
          generator: (i) => AcceleratedParticle(
            speed: (Vector2.random() - Vector2.all(0.5)) * 80,
            acceleration: Vector2(0, 150),
            position: spawnPosition.clone(),
            child: CircleParticle(
              radius: 3, // raggio più grande
              paint: Paint()..color = Colors.yellowAccent,
            ),
          ),
        ),
      );
}
