import 'package:flutter/material.dart';
import 'package:in_time_petition_demo/screens/about_screen/about_screen.dart';
import 'package:in_time_petition_demo/screens/donate_screen/donate_screen.dart';
import 'package:in_time_petition_demo/screens/home_screen/home_screen.dart';
import 'package:in_time_petition_demo/screens/supporters_screen/supporters_screen.dart';
import 'package:in_time_petition_demo/screens/updates_screen/updates_screen.dart';

class PagesRoutes {
  static const String home = "pages/home";
  static const String updates = "pages/updates";
  static const String supporters = "pages/supporters";
  static const String donate = "pages/donate";
  static const String aboutUs = "pages/about_us";

  static Route onGenerateRoute(RouteSettings settings) {
    Widget page;
    switch (settings.name) {
      case home:
        page = const HomeScreen();
        break;
      case updates:
        page = UpdatesScreen();
        break;
      case supporters:
        page = const SupportersScreen();
        break;
      case donate:
        page = const DonateScreen();
        break;
      case aboutUs:
        page = AboutScreen();
        break;
      default:
        page = const HomeScreen();
    }
    return PageRouteBuilder(
      settings: RouteSettings(name: settings.name),
      pageBuilder: (context, animation, secondaryAnimation) {
        secondaryAnimation =
            Tween(begin: 1.0, end: 0.0).animate(secondaryAnimation);
        return FadeTransition(
          opacity: secondaryAnimation,
          child: page,
        );
      },
      transitionsBuilder: (context, animation, anotherAnimation, child) {
        animation =
            CurvedAnimation(curve: Curves.easeInOutQuad, parent: animation);
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      transitionDuration: Duration(milliseconds: 500),
    );
  }
}
