class InGameLevels {
  static Map<int, String> characterLevelsMap = {
    1: 'Level 1',
    2: 'Level 2',
    3: 'Level 3',
    4: 'Level 4',
    5: 'Level 5',
    6: 'Level 6',
    7: 'Level 7',
    8: 'Level 8',
    9: 'Level 9',
    10: 'Level 10',
    11: 'Level 11',
    12: 'Level 12',
    13: 'Level 13',
    14: 'Level 14',
    15: 'Level 15',
    16: 'Level 16',
    17: 'Level 17',
    18: 'Level 18',
    19: 'Level 19',
    20: 'Level 20',
  };

  static List<String> characterLevelsList = [
    'Level 1',
    'Level 2',
    'Level 3',
    'Level 4',
    'Level 5',
    'Level 6',
    'Level 7',
    'Level 8',
    'Level 9',
    'Level 10',
    'Level 11',
    'Level 12',
    'Level 13',
    'Level 14',
    'Level 15',
    'Level 16',
    'Level 17',
    'Level 18',
    'Level 19',
    'Level 20',
  ];

  static int levelReturnIntFromString(String stringValue) {
    int? levelIntValue = characterLevelsMap.keys.firstWhere(
      (k) => characterLevelsMap[k] == stringValue,
    );
    return levelIntValue;
  }
}
