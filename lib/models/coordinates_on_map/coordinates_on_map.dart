import 'dart:convert';

import 'package:equatable/equatable.dart';

class CoordinatesOnMap extends Equatable {
  final int? width;
  final int? height;

  const CoordinatesOnMap({this.width, this.height});

  factory CoordinatesOnMap.fromMap(Map<String, dynamic> data) {
    return CoordinatesOnMap(
      width: data['width'] as int?,
      height: data['height'] as int?,
    );
  }

  Map<String, dynamic> toMap() => {
        'width': width,
        'height': height,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CoordinatesOnMap].
  factory CoordinatesOnMap.fromJson(String data) {
    return CoordinatesOnMap.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [CoordinatesOnMap] to a JSON string.
  String toJson() => json.encode(toMap());

  CoordinatesOnMap copyWith({
    int? width,
    int? height,
  }) {
    return CoordinatesOnMap(
      width: width ?? this.width,
      height: height ?? this.height,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [width, height];
}
