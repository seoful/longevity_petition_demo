import 'package:flutter/material.dart';
import 'package:in_time_petition_demo/components/animated_button.dart';
import 'package:in_time_petition_demo/core/routes/global_routes.dart';
import 'package:in_time_petition_demo/core/utils.dart';

class ThanksForSigningScreen extends StatelessWidget {
  const ThanksForSigningScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Thanks for signing our petition!",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 60,
              ),
              AnimatedButton(
                onTap: () {
                  Utils.mainNavigatorKey.currentState
                      ?.popUntil(ModalRoute.withName(GlobalRoutes.core));
                },
                child: Container(
                  width: 100,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Utils.accentColor,
                    // border: Border.all(color: Utils.accentColor, width: 1),
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
                      "Done",
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
        ),
      )),
    );
  }
}
