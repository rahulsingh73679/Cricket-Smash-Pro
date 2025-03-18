import 'package:flame/components.dart';
import '../config/constants.dart';

class Bat extends SpriteComponent with HasGameRef {
  double currentAngle;
  bool isSwinging;
  double swingSpeed;
  double targetAngle;

  Bat({
    required Vector2 position,
    required Vector2 size,
  }) : currentAngle = 0.0,
       isSwinging = false,
       swingSpeed = 0.0,
       targetAngle = 0.0,
       super(position: position, size: size);

  @override
  Future<void> onLoad() async {
    sprite = await gameRef.loadSprite(GameConstants.batSprite);
  }

  void swing(double angle) {
    if (!isSwinging) {
      isSwinging = true;
      targetAngle = angle;
      swingSpeed = GameConstants.batSpeed;
    }
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (isSwinging) {
      // Update bat angle
      if (currentAngle < targetAngle) {
        currentAngle += swingSpeed * dt;
      } else {
        currentAngle -= swingSpeed * dt;
      }

      // Check if swing is complete
      if ((currentAngle - targetAngle).abs() < 0.1) {
        isSwinging = false;
        currentAngle = 0.0;
      }

      // Update bat rotation
      angle = currentAngle;
    }
  }

  void reset() {
    isSwinging = false;
    currentAngle = 0.0;
    swingSpeed = 0.0;
    targetAngle = 0.0;
    angle = 0.0;
  }
} 