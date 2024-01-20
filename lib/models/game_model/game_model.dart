import 'dart:convert';

import 'package:equatable/equatable.dart';

class GameModel extends Equatable {
  final String? dmId;
  final String? gameName;
  final Map<String, dynamic>? diceHistory;
  final String? gamePathToPicture;
  final List<dynamic>? playersId;
  final List<dynamic>? charactersId;

  const GameModel({
    this.dmId,
    this.gameName,
    this.diceHistory,
    this.gamePathToPicture,
    this.playersId,
    this.charactersId,
  });

  factory GameModel.fromMap(Map<String, dynamic> data) => GameModel(
        dmId: data['dm_id'] as String?,
        gameName: data['game_name'] as String?,
        diceHistory: data['dice_history'] as Map<String, dynamic>?,
        gamePathToPicture: data['game_path_to_picture'] as String?,
        playersId: data['players_id'] as List<dynamic>?,
        charactersId: data['characters_id'] as List<dynamic>?,
      );

  Map<String, dynamic> toMap() => {
        'dm_id': dmId,
        'game_name': gameName,
        'dice_history': diceHistory,
        'game_path_to_picture': gamePathToPicture,
        'players_id': playersId,
        'characters_id': charactersId,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [GameModel].
  factory GameModel.fromJson(String data) {
    return GameModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [GameModel] to a JSON string.
  String toJson() => json.encode(toMap());

  GameModel copyWith({
    String? dmId,
    String? gameName,
    Map<String, dynamic>? diceHistory,
    String? gamePathToPicture,
    List<dynamic>? playersId,
    List<dynamic>? charactersId,
  }) {
    return GameModel(
      dmId: dmId ?? this.dmId,
      gameName: gameName ?? this.gameName,
      diceHistory: diceHistory ?? this.diceHistory,
      gamePathToPicture: gamePathToPicture ?? this.gamePathToPicture,
      playersId: playersId ?? this.playersId,
      charactersId: charactersId ?? this.charactersId,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      dmId,
      gameName,
      diceHistory,
      gamePathToPicture,
      playersId,
      charactersId,
    ];
  }
}
