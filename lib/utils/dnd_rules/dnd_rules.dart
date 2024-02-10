class DndRules {
  static List<String> listOfSkills = [
    'Athletics',
    'Acrobatics',
    'Sleight of Hand',
    'Stealth',
    'Arcana',
    'History',
    'Investigation',
    'Nature',
    'Religion',
    'Animal Handling',
    'Insight',
    'Medicine',
    'Perception',
    'Survival',
    'Deception',
    'Intimidation',
    'Performance',
    'Persuasion',
  ];

  static List<String> listOfSaveAttributes = [
    'Strength',
    'Dexterity',
    'Constitution',
    'Intelligence',
    'Wisdom',
    'Charisma',
  ];

  static Map<int, int> levelAndProficiencyMap = {
    1: 2,
    2: 2,
    3: 2,
    4: 2,
    5: 3,
    6: 3,
    7: 3,
    8: 3,
    9: 4,
    10: 4,
    11: 4,
    12: 4,
    13: 5,
    14: 5,
    15: 5,
    16: 5,
    17: 6,
    18: 6,
    19: 6,
    20: 6,
  };

  static Map<String, String> hintsList = {
    "attributes":
        "You generate your character’s six ability scores randomly. Roll four 6-sided dice and record the total of the highest three dice on a piece of scratch paper. Do this five more times, so that you have six numbers. If you want to save time or don’t like the idea of randomly determining ability scores, you can use the following scores instead: 15, 14, 13, 12, 10, 8.\nNow take your six numbers and write each number beside one of your character’s six abilities to assign scores to Strength, Dexterity, Constitution, Intelligence, Wisdom, and Charisma. Afterward, make any changes to your ability scores as a result of your race choice.",
    "proficiency":
        "Unique to 5th edition, instead of putting points into individual skills you have a general purpose \"proficiency bonus\" that's based on your level and is applied to attack rolls, saving throws, and skill checks if you're proficient in that task. Under You will find list of how many proficiency points on each level:\nLevel 1 - 2\nLevel 2 - 2\nLevel 3 - 2\nLevel 4 - 2\nLevel 5 - 3\nLevel 6 - 3\nLevel 7 - 3\nLevel 8 - 3\nLevel 9 - 4\nLevel 10 - 4\nLevel 11 - 4\nLevel 12 - 4\nLevel 13 - 5\nLevel 14 - 5\nLevel 15 - 5\nLevel 16 - 5\nLevel 17 - 6\nLevel 18 - 6\nLevel 19 - 6\nLevel 20 - 6\n",
    "armorClass":
        "When unarmored, your base Armor Class is 10 + Dexterity modifier. If you have a spell, item, feat, or racial trait that affects your Armor Class then the calculation will change. The two most common ways to increase AC are to pump your Dexterity modifier (if you’re not wearing heavy armor) or to equip better armor.",
    "initiative":
        "Initiative is a crucial aspect of combat in Dungeons & Dragons as it determines the order in which each creature takes their turn. When calculating initiative, there are a few things to note. Each creature has an Initiative Bonus, which is equal to their Dexterity Modifier, plus any bonuses they have from feats, classes, and such, which will state the bonuses they grant. When initiative is called, each creature acts from highest initiative to lowest.",
    "speed":
        "Every character and monster has a speed, which is the distance in feet that the character or monster can walk in 1 round. This number assumes short bursts of energetic movement in the midst of a life- threatening situation.",
    "hp":
        "Your character’s hit points define how tough your character is in combat and other dangerous situations. Your hit points are determined by your Hit Dice (short for Hit Point Dice).\nAt 1st level, your character has 1 Hit Die, and the die type is determined by your class. You start with hit points equal to the highest roll of that die, as indicated in your class description. (You also add your Constitution modifier, which you’ll determine in step 3.) This is also your hit point maximum",
    "notes":
        "You can add notes in this screen or create them later when You edit character or inside the game (one character can contain maximum of 10 notes). I hope this feature will help You with taking notes about attributes that can not be predicted - backgrounds, items, plot in the games and many more.",
  };

  static int formatAttributeToSaveCheck(
    int? attrbiute,
    int? proficiencyValue,
    bool? proficiency,
  ) {
    int value = 0;
    if (attrbiute != null) {
      value = DndRules.attributeToModifier(attrbiute);
      if (proficiency == true) {
        value += proficiencyValue ?? 0;
      }
    }
    return value;
  }

  static int attributeToModifier(int attribute) {
    int modifier = 0;
    if (attribute <= 1) {
      modifier = -5;
      return modifier;
    } else if (attribute == 2 || attribute == 3) {
      modifier = -4;
      return modifier;
    } else if (attribute == 4 || attribute == 5) {
      modifier = -3;
      return modifier;
    } else if (attribute == 6 || attribute == 7) {
      modifier = -2;
      return modifier;
    } else if (attribute == 8 || attribute == 9) {
      modifier = -1;
      return modifier;
    } else if (attribute == 10 || attribute == 11) {
      modifier = 0;
      return modifier;
    } else if (attribute == 12 || attribute == 13) {
      modifier = 1;
      return modifier;
    } else if (attribute == 14 || attribute == 15) {
      modifier = 2;
      return modifier;
    } else if (attribute == 16 || attribute == 17) {
      modifier = 3;
      return modifier;
    } else if (attribute == 18 || attribute == 19) {
      modifier = 4;
      return modifier;
    } else if (attribute == 20 || attribute == 21) {
      modifier = 5;
      return modifier;
    } else if (attribute == 22 || attribute == 23) {
      modifier = 6;
      return modifier;
    } else if (attribute == 24 || attribute == 25) {
      modifier = 7;
      return modifier;
    } else if (attribute == 26 || attribute == 27) {
      modifier = 8;
      return modifier;
    } else if (attribute == 28 || attribute == 29) {
      modifier = 9;
      return modifier;
    } else if (attribute >= 30) {
      modifier = 10;
      return modifier;
    }
    return modifier;
  }
}
