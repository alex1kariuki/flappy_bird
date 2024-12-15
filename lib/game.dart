import 'dart:async';

import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flappy_bird/components/background.dart';
import 'package:flappy_bird/components/bird.dart';
import 'package:flappy_bird/components/ground.dart';
import 'package:flappy_bird/constants.dart';
import 'package:flutter/material.dart';

class FlappyBirdGame extends FlameGame with TapDetector, HasCollisionDetection {
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

  // Game over logic
  bool isGameOver = false;
  void gameOver() {
    // Prevent multiple game over triggers
    if (isGameOver) return;

    isGameOver = true;
    pauseEngine();

    // Show Dialog box for user
    showDialog(
        context: buildContext!,
        builder: (context) => AlertDialog(
              title: const Text('Game Over!'),
              actions: [
                TextButton(
                    onPressed: () {
                      // Pop Box
                      Navigator.pop(context);

                      // Reset game
                      resetGame();
                    },
                    child: const Text('Restart'))
              ],
            ));
  }

  void resetGame() {
    bird.position = Vector2(birdStartX, birdStartY);
    bird.velocity = 0;
    isGameOver = false;
    resumeEngine();
  }
}
