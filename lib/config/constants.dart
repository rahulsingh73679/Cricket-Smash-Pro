class GameConstants {
  // Screen dimensions
  static const double screenWidth = 800.0;
  static const double screenHeight = 600.0;

  // Game physics
  static const double gravity = 9.8;
  static const double ballSpeed = 15.0;
  static const double batSpeed = 20.0;
  static const double maxBatAngle = 45.0;

  // Scoring
  static const int runsPerBoundary = 4;
  static const int runsPerSix = 6;
  static const int runsPerSingle = 1;

  // Game states
  static const String stateMenu = 'menu';
  static const String statePlaying = 'playing';
  static const String statePaused = 'paused';
  static const String stateGameOver = 'gameOver';

  // Asset paths
  static const String ballSprite = 'assets/sprites/ball.png';
  static const String batSprite = 'assets/sprites/bat.png';
  static const String backgroundSprite = 'assets/sprites/background.png';
  static const String playerSprite = 'assets/sprites/player.png';

  // Sound effects
  static const String hitSound = 'assets/audio/hit.mp3';
  static const String missSound = 'assets/audio/miss.mp3';
  static const String boundarySound = 'assets/audio/boundary.mp3';
  static const String sixSound = 'assets/audio/six.mp3';
} 