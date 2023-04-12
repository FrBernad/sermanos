import 'package:beamer/beamer.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/router.dart';
import 'package:sermanos/features/auth/presentation/screens/landing_screen.dart';
import 'package:sermanos/features/auth/presentation/screens/login_screen.dart';
import 'package:sermanos/features/auth/presentation/screens/register_screen.dart';
import 'package:sermanos/features/auth/presentation/screens/welcome_screen.dart';

class AuthLocation extends BeamLocation<BeamState> {
  AuthLocation(RouteInformation routeInformation) : super(routeInformation);

  @override
  List<String> get pathPatterns => [
        LandingScreen.route,
        LoginScreen.route,
        RegisterScreen.route,
      ];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    List<BeamPage> pages = [];

    pages.add(
      const BeamPage(
        key: ValueKey('landing'),
        child: LandingScreen(),
      ),
    );

    if (state.pathPatternSegments.contains(LoginScreen.routeName)) {
      pages.add(
        BeamPage(
          key: const ValueKey('login'),
          child: const LoginScreen(),
          onPopPage: _onPopPage,
        ),
      );
    }

    if (state.pathPatternSegments.contains(RegisterScreen.routeName)) {
      pages.add(
        BeamPage(
          key: const ValueKey('register'),
          child: const RegisterScreen(),
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
