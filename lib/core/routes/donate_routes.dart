import 'package:flutter/material.dart';
import 'package:in_time_petition_demo/screens/donate_screen/subscreens/choose_payment_method.dart';
import 'package:in_time_petition_demo/screens/donate_screen/subscreens/credit_card_payment_screen.dart';
import 'package:in_time_petition_demo/screens/donate_screen/subscreens/donation_done_screen.dart';

import '../../screens/donate_screen/subscreens/crypto_payment_method.dart';

class DonateRoutes {
  static const String choosePaymentMethod = "donate/choose_screen";
  static const String creditCardPayment = "donate/credit_card_payment_screen";
  static const String cryptoPayment = "donate/crypto_payment";
  static const String paymentDone = "donate/payment_done";

  static Route onGenerateRoute(RouteSettings settings) {
    Widget page;

    switch (settings.name) {
      case choosePaymentMethod:
        page = const ChoosePaymentMethodSubScreen();
        break;
      case creditCardPayment:
        page = CreditCardPaymentSubScreen();
        break;
      case cryptoPayment:
        final arg = settings.arguments as String?;
        if (arg == null) {
          page = CryptoPaymentSubScreen();
        } else {
          page = CryptoPaymentSubScreen(
            defaultCrypto: arg,
          );
        }
        break;
      case paymentDone:
        page = const DonationDoneSubScreen();
        break;
      default:
        page = const ChoosePaymentMethodSubScreen();
    }

    return PageRouteBuilder(
      settings: RouteSettings(
        name: settings.name,
      ),
      pageBuilder: (context, animation, secondaryAnimation) {
        secondaryAnimation =
            Tween(begin: 1.0, end: 0.0).animate(secondaryAnimation);
        return FadeTransition(opacity: secondaryAnimation, child: page);
      },
      transitionsBuilder: (context, animation, anotherAnimation, child) {
        animation =
            CurvedAnimation(curve: Curves.easeInOutQuad, parent: animation);
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 500),
    );
  }
}
