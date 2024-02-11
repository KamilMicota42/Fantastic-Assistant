import 'package:fantastic_assistant/utils/dnd_rules/dnd_rules.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('The lowest attribute into save throw wo prof', () {
    int att = 1;
    int saveThrow = DndRules.formatAttributeToSaveCheck(att, 2, false);
    expect(saveThrow, -5);
  });

  test('The lowest attribute into save throw w prof', () {
    int att = 1;
    int saveThrow = DndRules.formatAttributeToSaveCheck(att, 2, true);
    expect(saveThrow, -3);
  });

  test('The highest attribute into save throw wo prof', () {
    int att = 30;
    int saveThrow = DndRules.formatAttributeToSaveCheck(att, 6, false);
    expect(saveThrow, 10);
  });

  test('The highest attribute into save throw w prof', () {
    int att = 30;
    int saveThrow = DndRules.formatAttributeToSaveCheck(att, 6, true);
    expect(saveThrow, 16);
  });

  test('The lowest not legal attribute into save throw wo prof', () {
    int att = -999;
    int saveThrow = DndRules.formatAttributeToSaveCheck(att, 2, false);
    expect(saveThrow, -5);
  });

  test('The highest not legal attribute into save throw w prof', () {
    int att = 999;
    int saveThrow = DndRules.formatAttributeToSaveCheck(att, 2, true);
    expect(saveThrow, 12);
  });
}
