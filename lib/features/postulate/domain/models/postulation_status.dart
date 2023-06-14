import 'package:collection/collection.dart';

enum PostulationStatus {
  PENDING,
  ACCEPTED,
  REJECTED,
  NOT_SENT,
  UNKNOWN;


  static PostulationStatus getPostulationStatusFromString(String value) {
    PostulationStatus? s = PostulationStatus.values
        .firstWhereOrNull((PostulationStatus element) => element.name == value);
    if (s == null) {
      return PostulationStatus.UNKNOWN;
    }
    return s;
  }
}
