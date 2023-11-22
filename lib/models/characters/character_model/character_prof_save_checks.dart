import 'dart:convert';

import 'package:equatable/equatable.dart';

class CharacterProfSaveChecks extends Equatable {
  final bool? saveCharisma;
  final bool? saveConstitution;
  final bool? saveDexterity;
  final bool? saveIntelligence;
  final bool? saveStrength;
  final bool? saveWisdom;

  const CharacterProfSaveChecks({
    this.saveCharisma,
    this.saveConstitution,
    this.saveDexterity,
    this.saveIntelligence,
    this.saveStrength,
    this.saveWisdom,
  });

  factory CharacterProfSaveChecks.fromMap(Map<String, dynamic> data) {
    return CharacterProfSaveChecks(
      saveCharisma: data['save_charisma'] as bool?,
      saveConstitution: data['save_constitution'] as bool?,
      saveDexterity: data['save_dexterity'] as bool?,
      saveIntelligence: data['save_intelligence'] as bool?,
      saveStrength: data['save_strength'] as bool?,
      saveWisdom: data['save_wisdom'] as bool?,
    );
  }

  Map<String, dynamic> toMap() => {
        'save_charisma': saveCharisma,
        'save_constitution': saveConstitution,
        'save_dexterity': saveDexterity,
        'save_intelligence': saveIntelligence,
        'save_strength': saveStrength,
        'save_wisdom': saveWisdom,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CharacterProfSaveChecks].
  factory CharacterProfSaveChecks.fromJson(String data) {
    return CharacterProfSaveChecks.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [CharacterProfSaveChecks] to a JSON string.
  String toJson() => json.encode(toMap());

  CharacterProfSaveChecks copyWith({
    bool? saveCharisma,
    bool? saveConstitution,
    bool? saveDexterity,
    bool? saveIntelligence,
    bool? saveStrength,
    bool? saveWisdom,
  }) {
    return CharacterProfSaveChecks(
      saveCharisma: saveCharisma ?? this.saveCharisma,
      saveConstitution: saveConstitution ?? this.saveConstitution,
      saveDexterity: saveDexterity ?? this.saveDexterity,
      saveIntelligence: saveIntelligence ?? this.saveIntelligence,
      saveStrength: saveStrength ?? this.saveStrength,
      saveWisdom: saveWisdom ?? this.saveWisdom,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      saveCharisma,
      saveConstitution,
      saveDexterity,
      saveIntelligence,
      saveStrength,
      saveWisdom,
    ];
  }
}
