import 'package:flutter/material.dart';
import 'package:in_time_petition_demo/components/animated_button.dart';
import 'package:in_time_petition_demo/core/routes/global_routes.dart';
import 'package:in_time_petition_demo/core/utils.dart';

class NoCountriesFoundSubScreen extends StatelessWidget {
  const NoCountriesFoundSubScreen(this.country, {Key? key}) : super(key: key);

  final String country;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Text(
            "$country does not have a petition open",
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18,
              letterSpacing: 1,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 40,
          ),
          const Text(
            "Would you like to help us file a petition on this country?",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              letterSpacing: 1,
              height: 1.2,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 30,
          ),
          AnimatedButton(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
              Utils.mainNavigatorKey.currentState
                  ?.pushNamed(GlobalRoutes.signPetition);
            },
            child: Container(
              padding: const EdgeInsets.all(10),
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
                  "Sign with email",
                  style: TextStyle(
                      color: Utils.accentColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          AnimatedButton(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
              Utils.mainNavigatorKey.currentState
                  ?.pushNamed(GlobalRoutes.volunteer);
            },
            child: Container(
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
                  "Be a volunteer",
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
    );
  }
}
