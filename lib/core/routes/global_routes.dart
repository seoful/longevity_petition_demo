import 'package:flutter/material.dart';
import 'package:in_time_petition_demo/screens/core_screen/core_screen.dart';
import 'package:in_time_petition_demo/screens/petition_screen/petition_screen.dart';
import 'package:in_time_petition_demo/screens/sign_petition_by_email_screen/sign_petition_by_email_screen.dart';
import 'package:in_time_petition_demo/screens/sign_petition_by_email_screen/thanks_screen.dart';
import 'package:in_time_petition_demo/screens/volunteer_screen/volunteer_screen.dart';

class GlobalRoutes {
  static const String core = "main_screen";
  static const String petition = "petition_screen";
  static const String volunteer = "volunteer_screen";
  static const String signPetition = "sign_petition_screen";
  static const String thanksScreen = "thanks_screen";

  static Route? onGenerateRoute(RouteSettings settings) {
    Widget page = const CoreScreen();
    switch (settings.name) {
      case core:
        page = const CoreScreen();
        break;
      case petition:
        page = PetitionScreen();
        break;
      case volunteer:
        page = const VolunteerScreen();
        break;
      case signPetition:
        page = SignPetitionByEmailScreen();
        break;
      case thanksScreen:
        page = const ThanksForSigningScreen();
        break;
    }
    return MaterialPageRoute(
      builder: (context) => page,
      settings: RouteSettings(name: settings.name),
    );
  }
}
