import 'dart:async';

import 'package:flame/components.dart';

class Bird extends SpriteComponent {
  // Init Bird

  // Initialize Position & Size
  Bird() : super(position: Vector2(100, 100), size: Vector2(60, 40));

  // Physical World Properties
  double velocity = 0;
  final double gravity = 1800;
  final double jumpStrength = -300;

  // Load
  @override
  FutureOr<void> onLoad() async {
    // Load bird sprite image
    sprite = await Sprite.load('bird.png');
  }

  // Jump
  void flap() {
    velocity = jumpStrength;
  }

  // Update => every second
  @override
  void update(double dt) {
    // Apply gravity
    velocity += gravity * dt;

    // Update birds position based on current velocity
    position.y = velocity * dt;
  }
}
