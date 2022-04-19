import 'package:flutter/material.dart';
import 'package:in_time_petition_demo/components/animated_button.dart';
import 'package:in_time_petition_demo/core/routes/donate_routes.dart';
import 'package:in_time_petition_demo/core/utils.dart';

class ChoosePaymentMethodSubScreen extends StatelessWidget {
  const ChoosePaymentMethodSubScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      children: [
        const Text(
          "Choose Payment Method",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 21,
            // letterSpacing: 1,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 20,
        ),
        AnimatedButton(
          onTap: () {
            Utils.donateNavigatorKey.currentState
                ?.pushNamed(DonateRoutes.creditCardPayment);
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Utils.accentColor,
                width: 1,
              ),
            ),
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(
                    Icons.credit_card_outlined,
                    color: Utils.accentColor,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Credit Card",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Utils.accentColor,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        AnimatedButton(
          onTap: () {
            Utils.donateNavigatorKey.currentState
                ?.pushNamed(DonateRoutes.cryptoPayment);
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Utils.accentColor,
                width: 1,
              ),
            ),
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(
                    Icons.monetization_on,
                    color: Utils.accentColor,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Crypto",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Utils.accentColor,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        AnimatedButton(
          onTap: () {
            Utils.donateNavigatorKey.currentState
                ?.pushNamed(DonateRoutes.cryptoPayment, arguments: "LONG");
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Utils.accentColor,
                width: 1,
              ),
            ),
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(
                    Icons.monetization_on,
                    color: Utils.accentColor,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "LONG Coin",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Utils.accentColor,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        AnimatedButton(
          onTap: () {
            Utils.donateNavigatorKey.currentState
                ?.pushNamed(DonateRoutes.cryptoPayment, arguments: "AGE");
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Utils.accentColor,
                width: 1,
              ),
            ),
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(
                    Icons.monetization_on,
                    color: Utils.accentColor,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "AGE Coin",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Utils.accentColor,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
