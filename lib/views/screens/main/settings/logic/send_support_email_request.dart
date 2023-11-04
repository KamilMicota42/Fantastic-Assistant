import 'package:fantastic_assistant/utils/methods/show_snack_bar.dart';
import 'package:url_launcher/url_launcher.dart';

void sendSupportEmailRequest() async {
  try {
    final Uri params = Uri(
      scheme: 'mailto',
      path: 'fantastic.assistant.support@gmail.com',
      query: 'subject=Support Request&body=',
    );
    await launchUrl(params);
  } catch (e) {
    showSnackBar(e.toString());
  }
}
