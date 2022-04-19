import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:in_time_petition_demo/components/animated_button.dart';
import 'package:in_time_petition_demo/core/routes/donate_routes.dart';
import 'package:in_time_petition_demo/core/utils.dart';

class CryptoPaymentSubScreen extends StatefulWidget {
  CryptoPaymentSubScreen({Key? key, this.defaultCrypto = "BTC"})
      : super(key: key);

  final String defaultCrypto;

  @override
  State<CryptoPaymentSubScreen> createState() => _CryptoPaymentSubScreenState();
}

class _CryptoPaymentSubScreenState extends State<CryptoPaymentSubScreen> {
  final cryptos = ["BTC", "ETH", "LONG", "AGE", "MATIC", "DOT", "BNB"];

  late String chosenCrypto;

  @override
  void initState() {
    chosenCrypto = widget.defaultCrypto;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          const Text(
            "Pay with Crypto",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 21,
              // letterSpacing: 1,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          DropdownButton<String>(
            value: chosenCrypto,
            items: [
              ...cryptos.map(
                (e) => DropdownMenuItem(
                  child: Text(e),
                  value: e,
                ),
              ),
            ],
            onChanged: (String? newValue) {
              if (newValue != null) {
                setState(() {
                  chosenCrypto = newValue;
                });
              }
            },
          ),
          const SizedBox(
            height: 20,
          ),
          AnimatedButton(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.grey, width: 1)),
              child: const Text(
                "awdvbda7dgd67aw6dg336ygd",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              AnimatedButton(
                onTap: () {
                  Utils.donateNavigatorKey.currentState?.pop();
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white,
                    border: Border.all(color: Utils.accentColor, width: 1),
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: Colors.grey.withOpacity(0.3),
                    //     spreadRadius: 3,
                    //     blurRadius: 10,
                    //   ),
                    // ],
                  ),
                  child: const Center(
                    child: Text(
                      "Back",
                      style: TextStyle(
                          color: Utils.accentColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                  ),
                ),
              ),
              AnimatedButton(
                onTap: () {
                  Utils.donateNavigatorKey.currentState
                      ?.pushNamed(DonateRoutes.paymentDone);
                },
                child: Container(
                  width: 70,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Utils.accentColor,
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: Colors.grey.withOpacity(0.3),
                    //     spreadRadius: 3,
                    //     blurRadius: 10,
                    //   ),
                    // ],
                  ),
                  child: const Center(
                    child: Text(
                      "Ok",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
