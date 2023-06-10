import 'package:collection/collection.dart';

enum Gender {
  MALE,
  FEMALE,
  NO_BINARY,
  NOT_SPECIFIED;

  static Gender getGenderFromString(String value) {
    Gender? g = Gender.values
        .firstWhereOrNull((Gender element) => element.name == value);
    if (g == null) {
      return Gender.NOT_SPECIFIED;
    }
    return g;
  }
}
