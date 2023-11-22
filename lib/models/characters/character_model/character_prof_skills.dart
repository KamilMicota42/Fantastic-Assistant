import 'dart:convert';

import 'package:equatable/equatable.dart';

class CharacterProfSkills extends Equatable {
  final bool? acrobatics;
  final bool? animalHandling;
  final bool? arcana;
  final bool? athletics;
  final bool? deception;
  final bool? history;
  final bool? insight;
  final bool? intimidation;
  final bool? investigation;
  final bool? medicine;
  final bool? nature;
  final bool? perception;
  final bool? performance;
  final bool? persuasion;
  final bool? religion;
  final bool? sleightOfHand;
  final bool? stealth;
  final bool? survival;

  const CharacterProfSkills({
    this.acrobatics,
    this.animalHandling,
    this.arcana,
    this.athletics,
    this.deception,
    this.history,
    this.insight,
    this.intimidation,
    this.investigation,
    this.medicine,
    this.nature,
    this.perception,
    this.performance,
    this.persuasion,
    this.religion,
    this.sleightOfHand,
    this.stealth,
    this.survival,
  });

  factory CharacterProfSkills.fromMap(Map<String, dynamic> data) {
    return CharacterProfSkills(
      acrobatics: data['acrobatics'] as bool?,
      animalHandling: data['animal_handling'] as bool?,
      arcana: data['arcana'] as bool?,
      athletics: data['athletics'] as bool?,
      deception: data['deception'] as bool?,
      history: data['history'] as bool?,
      insight: data['insight'] as bool?,
      intimidation: data['intimidation'] as bool?,
      investigation: data['investigation'] as bool?,
      medicine: data['medicine'] as bool?,
      nature: data['nature'] as bool?,
      perception: data['perception'] as bool?,
      performance: data['performance'] as bool?,
      persuasion: data['persuasion'] as bool?,
      religion: data['religion'] as bool?,
      sleightOfHand: data['sleight_of_hand'] as bool?,
      stealth: data['stealth'] as bool?,
      survival: data['survival'] as bool?,
    );
  }

  Map<String, dynamic> toMap() => {
        'acrobatics': acrobatics,
        'animal_handling': animalHandling,
        'arcana': arcana,
        'athletics': athletics,
        'deception': deception,
        'history': history,
        'insight': insight,
        'intimidation': intimidation,
        'investigation': investigation,
        'medicine': medicine,
        'nature': nature,
        'perception': perception,
        'performance': performance,
        'persuasion': persuasion,
        'religion': religion,
        'sleight_of_hand': sleightOfHand,
        'stealth': stealth,
        'survival': survival,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CharacterProfSkills].
  factory CharacterProfSkills.fromJson(String data) {
    return CharacterProfSkills.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [CharacterProfSkills] to a JSON string.
  String toJson() => json.encode(toMap());

  CharacterProfSkills copyWith({
    bool? acrobatics,
    bool? animalHandling,
    bool? arcana,
    bool? athletics,
    bool? deception,
    bool? history,
    bool? insight,
    bool? intimidation,
    bool? investigation,
    bool? medicine,
    bool? nature,
    bool? perception,
    bool? performance,
    bool? persuasion,
    bool? religion,
    bool? sleightOfHand,
    bool? stealth,
    bool? survival,
  }) {
    return CharacterProfSkills(
      acrobatics: acrobatics ?? this.acrobatics,
      animalHandling: animalHandling ?? this.animalHandling,
      arcana: arcana ?? this.arcana,
      athletics: athletics ?? this.athletics,
      deception: deception ?? this.deception,
      history: history ?? this.history,
      insight: insight ?? this.insight,
      intimidation: intimidation ?? this.intimidation,
      investigation: investigation ?? this.investigation,
      medicine: medicine ?? this.medicine,
      nature: nature ?? this.nature,
      perception: perception ?? this.perception,
      performance: performance ?? this.performance,
      persuasion: persuasion ?? this.persuasion,
      religion: religion ?? this.religion,
      sleightOfHand: sleightOfHand ?? this.sleightOfHand,
      stealth: stealth ?? this.stealth,
      survival: survival ?? this.survival,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      acrobatics,
      animalHandling,
      arcana,
      athletics,
      deception,
      history,
      insight,
      intimidation,
      investigation,
      medicine,
      nature,
      perception,
      performance,
      persuasion,
      religion,
      sleightOfHand,
      stealth,
      survival,
    ];
  }
}
