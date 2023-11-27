import '../dnd_rules/attribute_to_modifier.dart';

int formatAttributeToSaveCheck(
  int? attrbiute,
  int? proficiencyValue,
  bool? proficiency,
) {
  int value = 0;
  if (attrbiute != null) {
    value = attributeToModifier(attrbiute);
    if (proficiency == true) {
      value += proficiencyValue ?? 0;
    }
  }
  return value;
}
