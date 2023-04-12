import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../design_system/tokens/app_colors.dart';

class AppShadows {
  AppShadows._();

  static List<BoxShadow> shadow1 = [
    BoxShadow(
      color: Colors.black.withOpacity(0.3),
      offset: const Offset(0, 1), // changes position of shadow
      blurRadius: 2,
    ),
    BoxShadow(
      color: Colors.black.withOpacity(0.15),
      offset: const Offset(0, 1), // changes position of shadow
      blurRadius: 3,
      spreadRadius: 1,
    ),
  ];
  static List<BoxShadow> shadow2 = [
    BoxShadow(
      color: Colors.black.withOpacity(0.3),
      offset: const Offset(0, 1), // changes position of shadow
      blurRadius: 2,
    ),
    BoxShadow(
      color: Colors.black.withOpacity(0.15),
      offset: const Offset(0, 2), // changes position of shadow
      blurRadius: 6,
      spreadRadius: 2,
    ),
  ];
  static List<BoxShadow> shadow3 = [
    BoxShadow(
      color: Colors.black.withOpacity(0.15),
      offset: const Offset(0, 8), // changes position of shadow
      blurRadius: 12,
      spreadRadius: 6,
    ),
    BoxShadow(
      color: Colors.black.withOpacity(0.3),
      offset: const Offset(0, 4), // changes position of shadow
      blurRadius: 4,
    ),
  ];
}
