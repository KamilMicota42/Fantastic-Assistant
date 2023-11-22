import 'dart:convert';

import 'package:equatable/equatable.dart';

class CharacterBasicInfo extends Equatable {
  final int? armorClass;
  final int? currentHp;
  final int? initiative;
  final int? maxHp;
  final int? proficiency;
  final int? speed;

  const CharacterBasicInfo({
    this.armorClass,
    this.currentHp,
    this.initiative,
    this.maxHp,
    this.proficiency,
    this.speed,
  });

  factory CharacterBasicInfo.fromMap(Map<String, dynamic> data) {
    return CharacterBasicInfo(
      armorClass: data['armor_class'] as int?,
      currentHp: data['current_hp'] as int?,
      initiative: data['initiative'] as int?,
      maxHp: data['max_hp'] as int?,
      proficiency: data['proficiency'] as int?,
      speed: data['speed'] as int?,
    );
  }

  Map<String, dynamic> toMap() => {
        'armor_class': armorClass,
        'current_hp': currentHp,
        'initiative': initiative,
        'max_hp': maxHp,
        'proficiency': proficiency,
        'speed': speed,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CharacterBasicInfo].
  factory CharacterBasicInfo.fromJson(String data) {
    return CharacterBasicInfo.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [CharacterBasicInfo] to a JSON string.
  String toJson() => json.encode(toMap());

  CharacterBasicInfo copyWith({
    int? armorClass,
    int? currentHp,
    int? initiative,
    int? maxHp,
    int? proficiency,
    int? speed,
  }) {
    return CharacterBasicInfo(
      armorClass: armorClass ?? this.armorClass,
      currentHp: currentHp ?? this.currentHp,
      initiative: initiative ?? this.initiative,
      maxHp: maxHp ?? this.maxHp,
      proficiency: proficiency ?? this.proficiency,
      speed: speed ?? this.speed,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      armorClass,
      currentHp,
      initiative,
      maxHp,
      proficiency,
      speed,
    ];
  }
}
