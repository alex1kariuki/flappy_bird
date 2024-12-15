import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flappy_bird/components/ground.dart';
import 'package:flappy_bird/components/pipe.dart';
import 'package:flappy_bird/constants.dart';
import 'package:flappy_bird/game.dart';

class Bird extends SpriteComponent with CollisionCallbacks {
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

    // Add a hit box
    add(RectangleHitbox());
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

  // Add Collision logic with other items
  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);

    // Check if collision is with ground
    if (other is Ground) {
      (parent as FlappyBirdGame).gameOver();
    }

    // Check if bird collides with the pipes
    if(other is Pipe){
       (parent as FlappyBirdGame).gameOver();
    }
  }
}
