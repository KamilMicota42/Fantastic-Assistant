import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'character_attributes.dart';
import 'character_basic_info.dart';
import 'character_prof_save_checks.dart';
import 'character_prof_skills.dart';

class CharacterModel extends Equatable {
  final String? accountId;
  final CharacterAttributes? characterAttributes;
  final CharacterBasicInfo? characterBasicInfo;
  final String? characterClass;
  final int? characterLevel;
  final String? characterName;
  final List<dynamic>? characterNotes;
  final String? characterPathToPicture;
  final CharacterProfSaveChecks? characterProfSaveChecks;
  final CharacterProfSkills? characterProfSkills;
  final String? characterRace;

  const CharacterModel({
    this.accountId,
    this.characterAttributes,
    this.characterBasicInfo,
    this.characterClass,
    this.characterLevel,
    this.characterName,
    this.characterNotes,
    this.characterPathToPicture,
    this.characterProfSaveChecks,
    this.characterProfSkills,
    this.characterRace,
  });

  factory CharacterModel.fromMap(Map<String, dynamic> data) {
    return CharacterModel(
      accountId: data['account_id'] as String?,
      characterAttributes:
          data['character_attributes'] == null ? null : CharacterAttributes.fromMap(data['character_attributes'] as Map<String, dynamic>),
      characterBasicInfo:
          data['character_basic_info'] == null ? null : CharacterBasicInfo.fromMap(data['character_basic_info'] as Map<String, dynamic>),
      characterClass: data['character_class'] as String?,
      characterLevel: data['character_level'] as int?,
      characterName: data['character_name'] as String?,
      characterNotes: data['character_notes'] as List<dynamic>?,
      characterPathToPicture: data['character_path_to_picture'] as String?,
      characterProfSaveChecks: data['character_prof_save_checks'] == null
          ? null
          : CharacterProfSaveChecks.fromMap(data['character_prof_save_checks'] as Map<String, dynamic>),
      characterProfSkills:
          data['character_prof_skills'] == null ? null : CharacterProfSkills.fromMap(data['character_prof_skills'] as Map<String, dynamic>),
      characterRace: data['character_race'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'account_id': accountId,
        'character_attributes': characterAttributes?.toMap(),
        'character_basic_info': characterBasicInfo?.toMap(),
        'character_class': characterClass,
        'character_level': characterLevel,
        'character_name': characterName,
        'character_notes': characterNotes,
        'character_path_to_picture': characterPathToPicture,
        'character_prof_save_checks': characterProfSaveChecks?.toMap(),
        'character_prof_skills': characterProfSkills?.toMap(),
        'character_race': characterRace,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CharacterModel].
  factory CharacterModel.fromJson(String data) {
    return CharacterModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [CharacterModel] to a JSON string.
  String toJson() => json.encode(toMap());

  CharacterModel copyWith({
    String? accountId,
    CharacterAttributes? characterAttributes,
    CharacterBasicInfo? characterBasicInfo,
    String? characterClass,
    int? characterLevel,
    String? characterName,
    List<dynamic>? characterNotes,
    String? characterPathToPicture,
    CharacterProfSaveChecks? characterProfSaveChecks,
    CharacterProfSkills? characterProfSkills,
    String? characterRace,
  }) {
    return CharacterModel(
      accountId: accountId ?? this.accountId,
      characterAttributes: characterAttributes ?? this.characterAttributes,
      characterBasicInfo: characterBasicInfo ?? this.characterBasicInfo,
      characterClass: characterClass ?? this.characterClass,
      characterLevel: characterLevel ?? this.characterLevel,
      characterName: characterName ?? this.characterName,
      characterNotes: characterNotes ?? this.characterNotes,
      characterPathToPicture: characterPathToPicture ?? this.characterPathToPicture,
      characterProfSaveChecks: characterProfSaveChecks ?? this.characterProfSaveChecks,
      characterProfSkills: characterProfSkills ?? this.characterProfSkills,
      characterRace: characterRace ?? this.characterRace,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      accountId,
      characterAttributes,
      characterBasicInfo,
      characterClass,
      characterLevel,
      characterName,
      characterNotes,
      characterPathToPicture,
      characterProfSaveChecks,
      characterProfSkills,
      characterRace,
    ];
  }
}
