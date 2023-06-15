import 'package:url_launcher/url_launcher.dart';

void openLocationOnGoogleMaps(final double lat, final double lng) async {
  String apiUrl = 'https://www.google.com/maps/search/?api=1&query=$lat,$lng';

  if (await canLaunchUrl(Uri.parse(apiUrl))) {
    await launchUrl(
      Uri.parse(apiUrl),
      mode: LaunchMode.externalApplication,
    );
  } else {
    throw 'Could not launch $apiUrl';
  }
}
