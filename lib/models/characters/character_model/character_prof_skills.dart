import 'dart:convert';

import 'package:equatable/equatable.dart';

class CharacterProfSkills extends Equatable {
  final bool? intimidation;
  final bool? arcana;
  final bool? perception;
  final bool? performance;
  final bool? deception;
  final bool? insight;
  final bool? investigation;
  final bool? history;
  final bool? nature;
  final bool? medicine;
  final bool? acrobatics;
  final bool? religion;
  final bool? animalHandling;
  final bool? athletics;
  final bool? persuasion;
  final bool? sleightOfHand;
  final bool? stealth;
  final bool? survival;

  const CharacterProfSkills({
    this.intimidation,
    this.arcana,
    this.perception,
    this.performance,
    this.deception,
    this.insight,
    this.investigation,
    this.history,
    this.nature,
    this.medicine,
    this.acrobatics,
    this.religion,
    this.animalHandling,
    this.athletics,
    this.persuasion,
    this.sleightOfHand,
    this.stealth,
    this.survival,
  });

  factory CharacterProfSkills.fromMap(Map<String, dynamic> data) {
    return CharacterProfSkills(
      intimidation: data['intimidation'] as bool?,
      arcana: data['arcana'] as bool?,
      perception: data['perception'] as bool?,
      performance: data['performance'] as bool?,
      deception: data['deception'] as bool?,
      insight: data['insight'] as bool?,
      investigation: data['investigation'] as bool?,
      history: data['history'] as bool?,
      nature: data['nature'] as bool?,
      medicine: data['medicine'] as bool?,
      acrobatics: data['acrobatics'] as bool?,
      religion: data['religion'] as bool?,
      animalHandling: data['animal_handling'] as bool?,
      athletics: data['athletics'] as bool?,
      persuasion: data['persuasion'] as bool?,
      sleightOfHand: data['sleight_of_hand'] as bool?,
      stealth: data['stealth'] as bool?,
      survival: data['survival'] as bool?,
    );
  }

  Map<String, dynamic> toMap() => {
        'intimidation': intimidation,
        'arcana': arcana,
        'perception': perception,
        'performance': performance,
        'deception': deception,
        'insight': insight,
        'investigation': investigation,
        'history': history,
        'nature': nature,
        'medicine': medicine,
        'acrobatics': acrobatics,
        'religion': religion,
        'animal_handling': animalHandling,
        'athletics': athletics,
        'persuasion': persuasion,
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
    bool? intimidation,
    bool? arcana,
    bool? perception,
    bool? performance,
    bool? deception,
    bool? insight,
    bool? investigation,
    bool? history,
    bool? nature,
    bool? medicine,
    bool? acrobatics,
    bool? religion,
    bool? animalHandling,
    bool? athletics,
    bool? persuasion,
    bool? sleightOfHand,
    bool? stealth,
    bool? survival,
  }) {
    return CharacterProfSkills(
      intimidation: intimidation ?? this.intimidation,
      arcana: arcana ?? this.arcana,
      perception: perception ?? this.perception,
      performance: performance ?? this.performance,
      deception: deception ?? this.deception,
      insight: insight ?? this.insight,
      investigation: investigation ?? this.investigation,
      history: history ?? this.history,
      nature: nature ?? this.nature,
      medicine: medicine ?? this.medicine,
      acrobatics: acrobatics ?? this.acrobatics,
      religion: religion ?? this.religion,
      animalHandling: animalHandling ?? this.animalHandling,
      athletics: athletics ?? this.athletics,
      persuasion: persuasion ?? this.persuasion,
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
      intimidation,
      arcana,
      perception,
      performance,
      deception,
      insight,
      investigation,
      history,
      nature,
      medicine,
      acrobatics,
      religion,
      animalHandling,
      athletics,
      persuasion,
      sleightOfHand,
      stealth,
      survival,
    ];
  }
}
