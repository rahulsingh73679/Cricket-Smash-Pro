class GameState {
  String currentState;
  int score;
  int wickets;
  int balls;
  int overs;
  bool isGameOver;

  GameState({
    this.currentState = 'menu',
    this.score = 0,
    this.wickets = 0,
    this.balls = 0,
    this.overs = 0,
    this.isGameOver = false,
  });

  void updateScore(int runs) {
    score += runs;
  }

  void addWicket() {
    wickets++;
    if (wickets >= 10) {
      isGameOver = true;
    }
  }

  void updateBalls() {
    balls++;
    if (balls >= 6) {
      balls = 0;
      overs++;
    }
  }

  void reset() {
    currentState = 'menu';
    score = 0;
    wickets = 0;
    balls = 0;
    overs = 0;
    isGameOver = false;
  }

  String getScoreDisplay() {
    return '$score/$wickets ($overs.${balls})';
  }
} 