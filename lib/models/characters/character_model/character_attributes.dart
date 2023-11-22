import 'dart:convert';

import 'package:equatable/equatable.dart';

class CharacterAttributes extends Equatable {
  final int? charisma;
  final int? constitution;
  final int? dexterity;
  final int? intelligence;
  final int? strength;
  final int? wisdom;

  const CharacterAttributes({
    this.charisma,
    this.constitution,
    this.dexterity,
    this.intelligence,
    this.strength,
    this.wisdom,
  });

  factory CharacterAttributes.fromMap(Map<String, dynamic> data) {
    return CharacterAttributes(
      charisma: data['charisma'] as int?,
      constitution: data['constitution'] as int?,
      dexterity: data['dexterity'] as int?,
      intelligence: data['intelligence'] as int?,
      strength: data['strength'] as int?,
      wisdom: data['wisdom'] as int?,
    );
  }

  Map<String, dynamic> toMap() => {
        'charisma': charisma,
        'constitution': constitution,
        'dexterity': dexterity,
        'intelligence': intelligence,
        'strength': strength,
        'wisdom': wisdom,
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
    int? charisma,
    int? constitution,
    int? dexterity,
    int? intelligence,
    int? strength,
    int? wisdom,
  }) {
    return CharacterAttributes(
      charisma: charisma ?? this.charisma,
      constitution: constitution ?? this.constitution,
      dexterity: dexterity ?? this.dexterity,
      intelligence: intelligence ?? this.intelligence,
      strength: strength ?? this.strength,
      wisdom: wisdom ?? this.wisdom,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      charisma,
      constitution,
      dexterity,
      intelligence,
      strength,
      wisdom,
    ];
  }
}
