import 'dart:convert';

import 'package:equatable/equatable.dart';

class CharacterToken extends Equatable {
  final String? id;
  final String? pathToPicture;

  const CharacterToken({this.id, this.pathToPicture});

  factory CharacterToken.fromMap(Map<String, dynamic> data) {
    return CharacterToken(
      id: data['id'] as String?,
      pathToPicture: data['pathToPicture'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'pathToPicture': pathToPicture,
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
    String? id,
    String? pathToPicture,
  }) {
    return CharacterToken(
      id: id ?? this.id,
      pathToPicture: pathToPicture ?? this.pathToPicture,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, pathToPicture];
}
