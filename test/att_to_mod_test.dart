import 'package:fantastic_assistant/utils/dnd_rules/dnd_rules.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('The lowest attribute into modifier', () {
    int att = 1;
    int mod = DndRules.attributeToModifier(att);
    expect(mod, -5);
  });

  test('The highest attribute into modifier', () {
    int att = 30;
    int mod = DndRules.attributeToModifier(att);
    expect(mod, 10);
  });

  test('Zero attribute into modifier', () {
    int att = 0;
    int mod = DndRules.attributeToModifier(att);
    expect(mod, -5);
  });

  test('Too low attribute into modifier', () {
    int att = -30;
    int mod = DndRules.attributeToModifier(att);
    expect(mod, -5);
  });

  test('Too high attribute into modifier', () {
    int att = 999;
    int mod = DndRules.attributeToModifier(att);
    expect(mod, 10);
  });
}
