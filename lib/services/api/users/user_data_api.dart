import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../models/user/user_additional_data.dart';
import '../../../settings/injection.dart';
import '../../../utils/methods/show_snack_bar.dart';
import '../../../views/screens/inital_loading/cubits/firebase_auth_current_user_uid.dart';

class UserDataApi {
  final CollectionReference _userAdditionalData = FirebaseFirestore.instance.collection('userAdditionalData');

  Future<void> createUserAdditionalData(
    BuildContext context,
    String userId,
    String email,
    String displayName,
  ) async {
    try {
      _userAdditionalData.doc(userId).set({
        'account_email': email,
        'account_display_name': displayName,
        'friends': [],
        'friends_requests': [],
      });
    } catch (e) {
      showSnackBar(e.toString());
    }
  }

  Future<void> getUserAdditionalDataToGetIt(userUid) async {
    var userAdditionalData = await FirebaseFirestore.instance.collection('userAdditionalData').doc(userUid).get();
    getIt<CurrentUserAdditionalData>().set(
      UserAdditionalData(
        accountId: userUid,
        accountEmail: userAdditionalData.data()?['account_email'],
        accountDisplayName: userAdditionalData.data()?['account_display_name'],
        friends: userAdditionalData.data()?['friends'],
        friendsRequests: userAdditionalData.data()?['friends_requests'],
      ),
    );
  }

  Future<void> changeUserDisplayName(
    String userUid,
    String newDisplayName,
  ) async {
    try {
      await _userAdditionalData.doc(userUid).update({"account_display_name": newDisplayName});
      await getUserAdditionalDataToGetIt(userUid);
      showSnackBar('Changed display name successfully');
    } catch (e) {
      showSnackBar(e.toString());
    }
  }

  Future<void> sendFriendRequest(
    String userWhoIsBeingInvitedId,
  ) async {
    try {
      var userAdditionalData = await FirebaseFirestore.instance.collection('userAdditionalData').doc(userWhoIsBeingInvitedId).get();
      List<dynamic> currentFriendsRequestsList = userAdditionalData.data()?['friends_requests'];
      currentFriendsRequestsList.add(getIt<CurrentUserAdditionalData>().state!.accountId);

      if (!currentFriendsRequestsList.contains(userWhoIsBeingInvitedId)) {
        await _userAdditionalData.doc(userWhoIsBeingInvitedId).update({"friends_requests": currentFriendsRequestsList});
      }
      showSnackBar('User invited successfully');
    } catch (e) {
      showSnackBar(e.toString());
    }
  }

  Future<void> declineFriendRequest(
    String userWhoSentInvitationId,
  ) async {
    try {
      List<dynamic> currentFriendsRequestsList = getIt<CurrentUserAdditionalData>().state!.friendsRequests!;
      currentFriendsRequestsList.remove(userWhoSentInvitationId);

      await _userAdditionalData.doc(getIt<CurrentUserAdditionalData>().state!.accountId).update({"friends_requests": currentFriendsRequestsList});
      await getUserAdditionalDataToGetIt(getIt<CurrentUserAdditionalData>().state!.accountId);
      showSnackBar('User invitation declined');
    } catch (e) {
      showSnackBar(e.toString());
    }
  }

  Future<void> acceptFriendRequest(
    String userWhoSentInvitationId,
  ) async {
    try {
      //update current user friends
      List<dynamic> currentFriendsList = getIt<CurrentUserAdditionalData>().state!.friends!;
      if (!currentFriendsList.contains(userWhoSentInvitationId)) {
        currentFriendsList.add(userWhoSentInvitationId);
      }
      await _userAdditionalData.doc(getIt<CurrentUserAdditionalData>().state!.accountId).update({"friends": currentFriendsList});
      //update user who sent invitation friends
      var userWhoSentInvite = await FirebaseFirestore.instance.collection('userAdditionalData').doc(userWhoSentInvitationId).get();
      List<dynamic> firendsListOfUserWhoSentInvite = userWhoSentInvite.data()?['friends'];
      if (!firendsListOfUserWhoSentInvite.contains(getIt<CurrentUserAdditionalData>().state!.accountId)) {
        firendsListOfUserWhoSentInvite.add(getIt<CurrentUserAdditionalData>().state!.accountId);
      }
      await _userAdditionalData.doc(userWhoSentInvitationId).update({"friends": firendsListOfUserWhoSentInvite});
      //delete invite from request list
      List<dynamic> currentFriendsRequestsList = getIt<CurrentUserAdditionalData>().state!.friendsRequests!;
      currentFriendsRequestsList.remove(userWhoSentInvitationId);
      await _userAdditionalData.doc(getIt<CurrentUserAdditionalData>().state!.accountId).update({"friends_requests": currentFriendsRequestsList});
      //refresh getIt
      await getUserAdditionalDataToGetIt(getIt<CurrentUserAdditionalData>().state!.accountId);
      showSnackBar('User invitation accepted');
    } catch (e) {
      showSnackBar(e.toString());
    }
  }
}
