import 'dart:async';

import 'package:flame/components.dart';
import 'package:flappy_bird/game.dart';
import 'package:flutter/material.dart';

class ScoreText extends TextComponent with HasGameRef<FlappyBirdGame> {
  // init
  ScoreText()
      : super(
          text: '0',
          textRenderer: TextPaint(
            style: TextStyle(
              color: Colors.grey.shade900,
              fontSize: 48,
            )
          )
        );

  // Load
  @override
  FutureOr<void> onLoad() {
    // Set the position to lower middle
    position = Vector2(
        // Center horizontally
        (gameRef.size.x - size.x) / 2,
        // Slightly above the bottom
        gameRef.size.y - size.y - 50);
  }

  // Update
  @override
  void update(double dt) {
    final newText = gameRef.score.toString();
    if (text != newText) {
      text = newText;
    }
  }
}
