import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flappy_bird/constants.dart';
import 'package:flappy_bird/game.dart';

class Pipe extends SpriteComponent
    with CollisionCallbacks, HasGameRef<FlappyBirdGame> {
  // Determine if the pipe is top or bottom
  final bool isTopPipe;

  // init
  Pipe(Vector2 position, Vector2 size, {required this.isTopPipe})
      : super(position: position, size: size);

  // Load
  @override
  FutureOr<void> onLoad() async {
    // Load Sprite image
    sprite = await Sprite.load(isTopPipe ? 'pipe_top.png' : 'pipe_bottom.png');

    // Add Hit box for the collision
    add(RectangleHitbox());
  }

  // Update
  @override
  void update(double dt) {
    // Scroll Pipe to left
    position.x -= groundScrollingSpeed * dt;

    // remove pipe if it goes off the screen
    if (position.x + size.x <= 0) {
      removeFromParent();
    }
  }
}
