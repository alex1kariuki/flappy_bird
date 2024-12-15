import 'dart:async';

import 'package:flame/components.dart';
import 'package:flappy_bird/constants.dart';

class Bird extends SpriteComponent {
  // Init Bird

  // Initialize Position & Size
  Bird()
      : super(
            position: Vector2(birdStartX, birdStartY),
            size: Vector2(birdWidth, birdHeight));

  // Physical World Properties
  double velocity = 0;
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
    position.y += velocity * dt;
  }
}
