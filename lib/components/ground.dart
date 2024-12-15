import 'dart:async';

import 'package:flame/components.dart';
import 'package:flappy_bird/constants.dart';
import 'package:flappy_bird/game.dart';

class Ground extends SpriteComponent with HasGameRef<FlappyBirdGame> {
  // Init
  Ground() : super();
  // Load
  @override
  FutureOr<void> onLoad() async {
    // set size & position (2x width for infinite scroll)
    size = Vector2(2 * gameRef.size.x, groundHeight);
    position = Vector2(0, gameRef.size.y - groundHeight);

    // Load ground sprite image
    sprite = await Sprite.load('ground.png');
  }

  // Update => every second
  @override
  void update(double dt) {
    // Move ground to left
    position.x -= groundScrollingSpeed * dt;

    // reset ground if it goes off screen for infinite scroll
    // if half of ground has been passed, reset.
    if (position.x + size.x / 2 <= 0) {
      position.x = 0;
    }
  }
}
