class UrlUtils {
  final String baseUrl;

  UrlUtils({required this.baseUrl});

  String generateLinkFromLocation(String location) {
    return '$baseUrl$location';
  }
}
