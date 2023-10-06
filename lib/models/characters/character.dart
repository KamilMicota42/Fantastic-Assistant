import 'package:equatable/equatable.dart';

class Character extends Equatable {
  final String? accountId;
  final String? characterId;
  final int? characterCurrHp;
  final int? characterMaxHp;
  final String? characterName;

  const Character({
    this.accountId,
    this.characterId,
    this.characterCurrHp,
    this.characterMaxHp,
    this.characterName,
  });

  factory Character.fromJson(Map<String, dynamic> json) => Character(
        accountId: json['account_id'] as String?,
        characterId: json['character_id'] as String?,
        characterCurrHp: json['character_curr_hp'] as int?,
        characterMaxHp: json['character_max_hp'] as int?,
        characterName: json['character_name'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'account_id': accountId,
        'character_id': characterId,
        'character_curr_hp': characterCurrHp,
        'character_max_hp': characterMaxHp,
        'character_name': characterName,
      };

  Character copyWith({
    String? accountId,
    String? characterId,
    int? characterCurrHp,
    int? characterMaxHp,
    String? characterName,
  }) {
    return Character(
      accountId: accountId ?? this.accountId,
      characterId: characterId ?? this.characterId,
      characterCurrHp: characterCurrHp ?? this.characterCurrHp,
      characterMaxHp: characterMaxHp ?? this.characterMaxHp,
      characterName: characterName ?? this.characterName,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      accountId,
      characterId,
      characterCurrHp,
      characterMaxHp,
      characterName,
    ];
  }
}
