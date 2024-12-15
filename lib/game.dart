import 'dart:async';

import 'package:flame/game.dart';
import 'package:flappy_bird/components/bird.dart';

class FlappyBirdGame extends FlameGame {
  late Bird bird;

  // Load
  @override
  FutureOr<void> onLoad() {
    // Load Bird
    bird = Bird();
    add(bird);
  }
}
