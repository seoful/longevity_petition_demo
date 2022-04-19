import 'package:flutter/material.dart';
import 'package:in_time_petition_demo/core/routes/donate_routes.dart';
import 'package:in_time_petition_demo/core/utils.dart';

import '../../../components/animated_button.dart';

class DonationDoneSubScreen extends StatelessWidget {
  const DonationDoneSubScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        const SizedBox(
          height: 50,
        ),
        const Text(
          "Thank You!",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w400,
            letterSpacing: 1.1,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 50,
        ),
        const CircleAvatar(
          backgroundColor: Utils.accentColor,
          child: Icon(
            Icons.done_rounded,
            size: 35,
          ),
          radius: 30,
        ),
        const SizedBox(
          height: 50,
        ),
        AnimatedButton(
          onTap: () {
            // _formKey.currentState?.validate();
            Utils.donateNavigatorKey.currentState?.popUntil(
                ModalRoute.withName(DonateRoutes.choosePaymentMethod));
          },
          child: Container(
            width: 50,
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
                "Done",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              ),
            ),
          ),
        )
      ],
    );
  }
}
