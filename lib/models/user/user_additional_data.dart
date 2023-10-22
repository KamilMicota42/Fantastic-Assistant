import 'dart:convert';

import 'package:equatable/equatable.dart';

class UserAdditionalData extends Equatable {
  final String? accountId;
  final String? accountEmail;
  final String? accountDisplayName;

  const UserAdditionalData({
    this.accountId,
    this.accountEmail,
    this.accountDisplayName,
  });

  factory UserAdditionalData.fromMap(Map<String, dynamic> data) {
    return UserAdditionalData(
      accountId: data['account_id'] as String?,
      accountEmail: data['account_email'] as String?,
      accountDisplayName: data['account_display_name'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'account_id': accountId,
        'account_email': accountEmail,
        'account_display_name': accountDisplayName,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [UserAdditionalData].
  factory UserAdditionalData.fromJson(String data) {
    return UserAdditionalData.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [UserAdditionalData] to a JSON string.
  String toJson() => json.encode(toMap());

  UserAdditionalData copyWith({
    String? accountId,
    String? accountEmail,
    String? accountDisplayName,
  }) {
    return UserAdditionalData(
      accountId: accountId ?? this.accountId,
      accountEmail: accountEmail ?? this.accountEmail,
      accountDisplayName: accountDisplayName ?? this.accountDisplayName,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      accountId,
      accountEmail,
      accountDisplayName,
    ];
  }
}
