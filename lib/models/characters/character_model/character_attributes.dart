import 'dart:convert';

import 'package:equatable/equatable.dart';

class CharacterAttributes extends Equatable {
  final int? dexterity;
  final int? wisdom;
  final int? constitution;
  final int? intelligence;
  final int? strength;
  final int? charisma;

  const CharacterAttributes({
    this.dexterity,
    this.wisdom,
    this.constitution,
    this.intelligence,
    this.strength,
    this.charisma,
  });

  factory CharacterAttributes.fromMap(Map<String, dynamic> data) {
    return CharacterAttributes(
      dexterity: data['dexterity'] as int?,
      wisdom: data['wisdom'] as int?,
      constitution: data['constitution'] as int?,
      intelligence: data['intelligence'] as int?,
      strength: data['strength'] as int?,
      charisma: data['charisma'] as int?,
    );
  }

  Map<String, dynamic> toMap() => {
        'dexterity': dexterity,
        'wisdom': wisdom,
        'constitution': constitution,
        'intelligence': intelligence,
        'strength': strength,
        'charisma': charisma,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CharacterAttributes].
  factory CharacterAttributes.fromJson(String data) {
    return CharacterAttributes.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [CharacterAttributes] to a JSON string.
  String toJson() => json.encode(toMap());

  CharacterAttributes copyWith({
    int? dexterity,
    int? wisdom,
    int? constitution,
    int? intelligence,
    int? strength,
    int? charisma,
  }) {
    return CharacterAttributes(
      dexterity: dexterity ?? this.dexterity,
      wisdom: wisdom ?? this.wisdom,
      constitution: constitution ?? this.constitution,
      intelligence: intelligence ?? this.intelligence,
      strength: strength ?? this.strength,
      charisma: charisma ?? this.charisma,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      dexterity,
      wisdom,
      constitution,
      intelligence,
      strength,
      charisma,
    ];
  }
}
