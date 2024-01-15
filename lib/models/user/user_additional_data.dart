import 'dart:convert';

import 'package:equatable/equatable.dart';

class UserAdditionalData extends Equatable {
  final List<dynamic>? friends;
  final String? accountId;
  final String? accountEmail;
  final String? accountDisplayName;
  final List<dynamic>? friendsRequests;

  const UserAdditionalData({
    this.friends,
    this.accountId,
    this.accountEmail,
    this.accountDisplayName,
    this.friendsRequests,
  });

  factory UserAdditionalData.fromMap(Map<String, dynamic> data) {
    return UserAdditionalData(
      friends: data['friends'] as List<dynamic>?,
      accountId: data['account_id'] as String?,
      accountEmail: data['account_email'] as String?,
      accountDisplayName: data['account_display_name'] as String?,
      friendsRequests: data['friends_requests'] as List<dynamic>?,
    );
  }

  Map<String, dynamic> toMap() => {
        'friends': friends,
        'account_id': accountId,
        'account_email': accountEmail,
        'account_display_name': accountDisplayName,
        'friends_requests': friendsRequests,
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
    List<dynamic>? friends,
    String? accountId,
    String? accountEmail,
    String? accountDisplayName,
    List<dynamic>? friendsRequests,
  }) {
    return UserAdditionalData(
      friends: friends ?? this.friends,
      accountId: accountId ?? this.accountId,
      accountEmail: accountEmail ?? this.accountEmail,
      accountDisplayName: accountDisplayName ?? this.accountDisplayName,
      friendsRequests: friendsRequests ?? this.friendsRequests,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      friends,
      accountId,
      accountEmail,
      accountDisplayName,
      friendsRequests,
    ];
  }
}
