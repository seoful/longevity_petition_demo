import 'package:flutter/material.dart';
import 'package:in_time_petition_demo/components/animated_button.dart';
import 'package:in_time_petition_demo/components/appbar.dart';
import 'package:in_time_petition_demo/core/strings.dart';
import 'package:in_time_petition_demo/core/utils.dart';

class VolunteerScreen extends StatelessWidget {
  const VolunteerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomAppbar(
              title: "Be a volunteer",
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              trailing: Icons.close_rounded,
              onTrailingTap: () {
                Utils.mainNavigatorKey.currentState?.pop();
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      Strings.volunteer_2,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        letterSpacing: 1,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Text(
                        Strings.volunteer_3,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          letterSpacing: 1,
                          height: 1.2,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      Strings.volunteer_4,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        letterSpacing: 1,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "1.",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                              letterSpacing: 1,
                              // height: 1.2,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Flexible(
                            child: Text(
                              Strings.volunteer_5,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                letterSpacing: 1,
                                height: 1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Text(
                            "2.",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                              letterSpacing: 1,
                              // height: 1.2,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Flexible(
                            child: Text(
                              Strings.volunteer_6,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                letterSpacing: 1,
                                height: 1,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AnimatedButton(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(12),
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
                          "Send draft by email",
                          style: TextStyle(
                              color: Utils.accentColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                  AnimatedButton(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(12),
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
                          "Download letter",
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
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
