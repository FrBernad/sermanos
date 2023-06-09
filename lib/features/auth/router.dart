import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:sermanos/features/auth/presentation/screens/landing_screen.dart';
import 'package:sermanos/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:sermanos/features/auth/presentation/screens/sign_up_screen.dart';

class AuthLocation extends BeamLocation<BeamState> {
  AuthLocation(RouteInformation routeInformation) : super(routeInformation);

  static const String pathPrefix = "/auth";

  @override
  List<String> get pathPatterns => [
        LandingScreen.route,
        SignInScreen.route,
        SignUpScreen.route,
      ];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    List<BeamPage> pages = [];

    pages.add(
      const BeamPage(
        key: ValueKey(LandingScreen.routeName),
        child: LandingScreen(),
      ),
    );

    if (state.pathPatternSegments.contains(SignInScreen.routeName)) {
      pages.add(
        BeamPage(
          key: const ValueKey(SignInScreen.routeName),
          child: const SignInScreen(),
          onPopPage: _onPopPage,
        ),
      );
    }

    if (state.pathPatternSegments.contains(SignUpScreen.routeName)) {
      pages.add(
        BeamPage(
          key: const ValueKey(SignUpScreen.routeName),
          child: const SignUpScreen(),
          onPopPage: _onPopPage,
        ),
      );
    }

    return pages;
  }

  bool _onPopPage(BuildContext context, BeamerDelegate delegate, _, page) {
    delegate.update(
      configuration: const RouteInformation(
        location: LandingScreen.route,
      ),
      rebuild: false,
    );
    return true;
  }
}
