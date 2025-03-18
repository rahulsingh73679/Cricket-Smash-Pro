import 'package:flame/components.dart';
import '../config/constants.dart';

class Ball extends SpriteComponent with HasGameRef {
  Vector2 velocity;
  bool isInPlay;
  double rotationSpeed;

  Ball({
    required Vector2 position,
    required Vector2 size,
  }) : velocity = Vector2.zero(),
       isInPlay = false,
       rotationSpeed = 0.0,
       super(position: position, size: size);

  @override
  Future<void> onLoad() async {
    sprite = await gameRef.loadSprite(GameConstants.ballSprite);
  }

  void throwBall(double angle, double speed) {
    isInPlay = true;
    velocity = Vector2(
      speed * angle.cos(),
      speed * angle.sin(),
    );
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (isInPlay) {
      // Apply gravity
      velocity.y += GameConstants.gravity * dt;
      
      // Update position
      position += velocity * dt;
      
      // Update rotation
      angle += rotationSpeed * dt;
      
      // Check if ball is out of bounds
      if (position.y > GameConstants.screenHeight) {
        isInPlay = false;
        velocity = Vector2.zero();
      }
    }
  }

  void reset() {
    isInPlay = false;
    velocity = Vector2.zero();
    rotationSpeed = 0.0;
  }
} 