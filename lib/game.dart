import 'dart:async';

import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flappy_bird/components/background.dart';
import 'package:flappy_bird/components/bird.dart';
import 'package:flappy_bird/components/ground.dart';

class FlappyBirdGame extends FlameGame with TapDetector {
  late Bird bird;
  late Background background;
  late Ground ground;
  // Load
  @override
  FutureOr<void> onLoad() {
    // Load background
    background = Background(size);
    add(background);

    // Load Bird
    bird = Bird();
    add(bird);

    // Load Ground
    ground = Ground();
    add(ground);
  }

  // On Tap
  @override
  void onTap() {
    bird.flap();
  }
}
