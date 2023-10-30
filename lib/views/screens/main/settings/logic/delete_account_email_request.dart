import 'package:fantastic_assistant/services/cubits/user_related_cubits/firebase_auth_current_user_uid.dart';
import 'package:fantastic_assistant/settings/injection.dart';
import 'package:fantastic_assistant/utils/methods/show_snack_bar.dart';
import 'package:url_launcher/url_launcher.dart';

void deleteAccountEmailRequest() async {
  try {
    final Uri params = Uri(
      scheme: 'mailto',
      path: 'fantastic.assistant.support@gmail.com',
      query:
          'subject=Delete Account Request&body=I kindly ask the Fantastic Assistant support group to delete my account. I am aware of the fact that all the information about my account will be forever removed from any type of databases. Infomarion about the account: \nAccount Display Name: ${getIt<CurrentUserAdditionalData>().state!.accountDisplayName}\nAccount Email: ${getIt<CurrentUserAdditionalData>().state!.accountEmail}\nAccount Id: ${getIt<CurrentUserAdditionalData>().state!.accountId}\nKind regards',
    );
    await launchUrl(params);
  } catch (e) {
    showSnackBar(e.toString());
  }
}
