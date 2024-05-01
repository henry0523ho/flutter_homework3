class GameScore {
  final String name;
  Map<String, int> score = {
    "ace": 0,
    "twos": 0,
    "threes": 0,
    "fours": 0,
    "fives": 0,
    "sixs": 0,
    "threeOfAKind": 0,
    "fourOfAKind": 0,
    "fullHouse": 0,
    "smallStraight": 0,
    "largeStraight": 0,
    "yahtzee": 0,
    "chance": 0,
  };

  GameScore(this.name);

  void setScore(String key, int value) {
    score[key] = value;
  }
  int? getScore(String key) {
    return score[key];
  }
  Map<String, int> getFullScore() {
    Map<String, int> fullScore = {};
    score.forEach((key, value) {
      fullScore[key] = value;
    });
    fullScore["bonus"] = 0;
    int minorSum = 0;
    for (var key in ["ace", "twos", "threes", "fours", "fives", "sixs"]) {
      minorSum += score[key]!;
    }
    if (minorSum >= 63) {
      fullScore["bonus"] = 35;
    }
    int totalSum = 0;
    for (var key in score.keys) {
      totalSum += score[key]!;
    }
    fullScore["total"] = totalSum;
    return fullScore;
  }

  
}