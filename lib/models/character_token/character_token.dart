import 'dart:convert';

import 'package:equatable/equatable.dart';

class CharacterToken extends Equatable {
  final int? width;
  final int? height;
  final String? characterId;
  final String? characterPicture;

  const CharacterToken({
    this.width,
    this.height,
    this.characterId,
    this.characterPicture,
  });

  factory CharacterToken.fromMap(Map<String, dynamic> data) {
    return CharacterToken(
      width: data['width'] as int?,
      height: data['height'] as int?,
      characterId: data['characterId'] as String?,
      characterPicture: data['characterPicture'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'width': width,
        'height': height,
        'characterId': characterId,
        'characterPicture': characterPicture,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CharacterToken].
  factory CharacterToken.fromJson(String data) {
    return CharacterToken.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [CharacterToken] to a JSON string.
  String toJson() => json.encode(toMap());

  CharacterToken copyWith({
    int? width,
    int? height,
    String? characterId,
    String? characterPicture,
  }) {
    return CharacterToken(
      width: width ?? this.width,
      height: height ?? this.height,
      characterId: characterId ?? this.characterId,
      characterPicture: characterPicture ?? this.characterPicture,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      width,
      height,
      characterId,
      characterPicture,
    ];
  }
}
