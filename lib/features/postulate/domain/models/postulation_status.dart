import 'package:collection/collection.dart';

enum PostulationStatus {
  pending,
  accepted,
  rejected,
  unknown;

  static PostulationStatus? getPostulationStatusFromString(String value) {
    PostulationStatus? s = PostulationStatus.values
        .firstWhereOrNull((PostulationStatus element) => element.name == value);
    if (s == null) {
      return PostulationStatus.unknown;
    }
    return s;
  }
}
