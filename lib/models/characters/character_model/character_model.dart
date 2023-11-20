import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'character_attributes.dart';
import 'character_basic_info.dart';
import 'character_prof_save_checks.dart';
import 'character_prof_skills.dart';

class CharacterModel extends Equatable {
  final int? characterLevel;
  final CharacterBasicInfo? characterBasicInfo;
  final CharacterProfSkills? characterProfSkills;
  final String? characterPathToPicture;
  final String? characterName;
  final String? characterClass;
  final CharacterAttributes? characterAttributes;
  final CharacterProfSaveChecks? characterProfSaveChecks;
  final String? characterRace;
  final String? accountId;

  const CharacterModel({
    this.characterLevel,
    this.characterBasicInfo,
    this.characterProfSkills,
    this.characterPathToPicture,
    this.characterName,
    this.characterClass,
    this.characterAttributes,
    this.characterProfSaveChecks,
    this.characterRace,
    this.accountId,
  });

  factory CharacterModel.fromMap(Map<String, dynamic> data) {
    return CharacterModel(
      characterLevel: data['character_level'] as int?,
      characterBasicInfo: data['character_basic_info'] == null
          ? null
          : CharacterBasicInfo.fromMap(
              data['character_basic_info'] as Map<String, dynamic>),
      characterProfSkills: data['character_prof_skills'] == null
          ? null
          : CharacterProfSkills.fromMap(
              data['character_prof_skills'] as Map<String, dynamic>),
      characterPathToPicture: data['character_path_to_picture'] as String?,
      characterName: data['character_name'] as String?,
      characterClass: data['character_class'] as String?,
      characterAttributes: data['character_attributes'] == null
          ? null
          : CharacterAttributes.fromMap(
              data['character_attributes'] as Map<String, dynamic>),
      characterProfSaveChecks: data['character_prof_save_checks'] == null
          ? null
          : CharacterProfSaveChecks.fromMap(
              data['character_prof_save_checks'] as Map<String, dynamic>),
      characterRace: data['character_race'] as String?,
      accountId: data['account_id'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'character_level': characterLevel,
        'character_basic_info': characterBasicInfo?.toMap(),
        'character_prof_skills': characterProfSkills?.toMap(),
        'character_path_to_picture': characterPathToPicture,
        'character_name': characterName,
        'character_class': characterClass,
        'character_attributes': characterAttributes?.toMap(),
        'character_prof_save_checks': characterProfSaveChecks?.toMap(),
        'character_race': characterRace,
        'account_id': accountId,
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
    int? characterLevel,
    CharacterBasicInfo? characterBasicInfo,
    CharacterProfSkills? characterProfSkills,
    String? characterPathToPicture,
    String? characterName,
    String? characterClass,
    CharacterAttributes? characterAttributes,
    CharacterProfSaveChecks? characterProfSaveChecks,
    String? characterRace,
    String? accountId,
  }) {
    return CharacterModel(
      characterLevel: characterLevel ?? this.characterLevel,
      characterBasicInfo: characterBasicInfo ?? this.characterBasicInfo,
      characterProfSkills: characterProfSkills ?? this.characterProfSkills,
      characterPathToPicture:
          characterPathToPicture ?? this.characterPathToPicture,
      characterName: characterName ?? this.characterName,
      characterClass: characterClass ?? this.characterClass,
      characterAttributes: characterAttributes ?? this.characterAttributes,
      characterProfSaveChecks:
          characterProfSaveChecks ?? this.characterProfSaveChecks,
      characterRace: characterRace ?? this.characterRace,
      accountId: accountId ?? this.accountId,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      characterLevel,
      characterBasicInfo,
      characterProfSkills,
      characterPathToPicture,
      characterName,
      characterClass,
      characterAttributes,
      characterProfSaveChecks,
      characterRace,
      accountId,
    ];
  }
}
