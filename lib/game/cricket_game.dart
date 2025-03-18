import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flame/input.dart';
import '../models/ball.dart';
import '../models/bat.dart';
import '../models/game_state.dart';
import '../config/constants.dart';

class CricketGame extends FlameGame with TapDetector {
  late Ball ball;
  late Bat bat;
  late GameState gameState;
  late TextComponent scoreText;
  late TextComponent timerText;
  
  @override
  Future<void> onLoad() async {
    // Initialize game components
    gameState = GameState();
    
    // Create ball
    ball = Ball(
      position: Vector2(size.x * 0.5, size.y * 0.2),
      size: Vector2(30, 30),
    );
    add(ball);
    
    // Create bat
    bat = Bat(
      position: Vector2(size.x * 0.5, size.y * 0.8),
      size: Vector2(100, 20),
    );
    add(bat);
    
    // Create score text
    scoreText = TextComponent(
      text: gameState.getScoreDisplay(),
      position: Vector2(20, 20),
      textRenderer: TextPaint(
        style: const TextStyle(
          fontSize: 24,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
    add(scoreText);
    
    // Create timer text
    timerText = TextComponent(
      text: 'Time: 0',
      position: Vector2(size.x - 100, 20),
      textRenderer: TextPaint(
        style: const TextStyle(
          fontSize: 24,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
    add(timerText);
    
    // Start game
    startGame();
  }
  
  void startGame() {
    gameState.currentState = GameConstants.statePlaying;
    gameState.reset();
    updateScoreDisplay();
    throwNewBall();
  }
  
  void throwNewBall() {
    if (!gameState.isGameOver) {
      double angle = -45 * (3.14159 / 180); // -45 degrees in radians
      ball.throwBall(angle, GameConstants.ballSpeed);
    }
  }
  
  void updateScoreDisplay() {
    scoreText.text = gameState.getScoreDisplay();
  }
  
  @override
  void update(double dt) {
    super.update(dt);
    
    if (gameState.currentState == GameConstants.statePlaying) {
      // Check for collision between ball and bat
      if (ball.isInPlay && bat.isSwinging) {
        if (ball.toRect().overlaps(bat.toRect())) {
          // Calculate hit based on bat angle and ball position
          double hitQuality = calculateHitQuality();
          handleHit(hitQuality);
        }
      }
      
      // Check if ball is out of play
      if (!ball.isInPlay && !gameState.isGameOver) {
        gameState.addWicket();
        updateScoreDisplay();
        if (!gameState.isGameOver) {
          throwNewBall();
        } else {
          gameOver();
        }
      }
    }
  }
  
  double calculateHitQuality() {
    // Calculate how well the ball was hit based on bat angle and ball position
    double batAngle = bat.currentAngle;
    double ballAngle = (ball.position - bat.position).angleToSigned(Vector2(1, 0));
    return 1.0 - (batAngle - ballAngle).abs() / (GameConstants.maxBatAngle * 2);
  }
  
  void handleHit(double hitQuality) {
    int runs;
    if (hitQuality > 0.8) {
      runs = GameConstants.runsPerSix;
    } else if (hitQuality > 0.5) {
      runs = GameConstants.runsPerBoundary;
    } else {
      runs = GameConstants.runsPerSingle;
    }
    
    gameState.updateScore(runs);
    gameState.updateBalls();
    updateScoreDisplay();
    
    ball.reset();
    bat.reset();
    throwNewBall();
  }
  
  void gameOver() {
    gameState.currentState = GameConstants.stateGameOver;
    overlays.add('gameOver');
  }
  
  @override
  void onTapDown(TapDownInfo info) {
    if (gameState.currentState == GameConstants.statePlaying) {
      // Calculate swing angle based on tap position
      Vector2 tapPosition = info.eventPosition.game;
      Vector2 batPosition = bat.position;
      double angle = (tapPosition - batPosition).angleToSigned(Vector2(1, 0));
      angle = angle.clamp(-GameConstants.maxBatAngle, GameConstants.maxBatAngle);
      
      bat.swing(angle);
    }
  }
  
  @override
  void onPause() {
    if (gameState.currentState == GameConstants.statePlaying) {
      gameState.currentState = GameConstants.statePaused;
      overlays.add('pause');
    }
  }
  
  @override
  void onResume() {
    if (gameState.currentState == GameConstants.statePaused) {
      gameState.currentState = GameConstants.statePlaying;
      overlays.remove('pause');
    }
  }
} 