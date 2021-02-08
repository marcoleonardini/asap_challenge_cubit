import 'package:asap_challenge_cubit/src/ui/screens/account_details/account_details_screen.dart';
import 'package:asap_challenge_cubit/src/ui/screens/home_screen/home_screen.dart';
import 'package:asap_challenge_cubit/src/ui/screens/login_screen/login_screen.dart';
import 'package:asap_challenge_cubit/src/ui/screens/sign_up_screen/sign_up_screen.dart';
import 'package:asap_challenge_cubit/src/ui/screens/splash_screen/splash_screen.dart';
import 'package:asap_challenge_cubit/src/ui/screens/no_route_screen/no_route.screen.dart';
import 'package:flutter/material.dart';

class AppRoute {
  static Route getRoutes(RouteSettings settings) {
    switch (settings.name) {
      case SplasScreen.route:
        return MaterialPageRoute(builder: (context) => SplasScreen());
      case LoginScreen.route:
        return MaterialPageRoute(builder: (context) => LoginScreen());
      case HomeScreen.route:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case AccountDetailsScreen.route:
        return MaterialPageRoute(builder: (context) => AccountDetailsScreen());
      case SignUpScreen.route:
        return MaterialPageRoute(builder: (context) => SignUpScreen());

      default:
        return MaterialPageRoute(builder: (context) => NoRouteScreen());
    }
  }
}
