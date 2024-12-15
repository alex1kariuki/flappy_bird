import 'dart:math';

import 'package:flame/components.dart';
import 'package:flappy_bird/components/pipe.dart';
import 'package:flappy_bird/constants.dart';
import 'package:flappy_bird/game.dart';

class PipeManager extends Component with HasGameRef<FlappyBirdGame> {
  // Update Every Second
  double pipeSpawnTimer = 0;

  @override
  void update(double dt) {
    // generate new pipe at given interval
    pipeSpawnTimer += dt;



    if (pipeSpawnTimer > pipeInterval) {
      pipeSpawnTimer = 0;
      spawnPipe();
    }
  }

  // Spawn New Pipes
  void spawnPipe() {
    final double screenHeight = gameRef.size.y;


    // Calculate Pipe Heights

// Max Possible Height
    final double maxPipeHeight =
        screenHeight - groundHeight - pipeGap - minPipeHeight;

    //  Height of bottom pipe -> randomly select between min and max
    final double bottomPipeHeight =
        minPipeHeight + Random().nextDouble() * (maxPipeHeight - minPipeHeight);

    // Height of the top pipe
    final double topPipeHeight =
        screenHeight - groundHeight - bottomPipeHeight - pipeGap;

    // Create Bottom Pipe
    final bottomPipe = Pipe(
      // Position
      Vector2(gameRef.size.x, screenHeight - groundHeight - bottomPipeHeight),
      // Size
      Vector2(pipeWidth, bottomPipeHeight),
      isTopPipe: false,
    );

    // Create Top Pipe
    final topPipe = Pipe(
      // Position
      Vector2(gameRef.size.x, 0),
      // Size
      Vector2(pipeWidth, topPipeHeight),
      isTopPipe: true,
    );

    // Add Both Pipes to the game
    gameRef.add(bottomPipe);
    gameRef.add(topPipe);
  }
}
