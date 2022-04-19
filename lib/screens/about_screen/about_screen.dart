import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:in_time_petition_demo/components/animated_button.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  AboutScreen({Key? key}) : super(key: key);

  final productsList = [
    "BMI Disease Tracker",
    "AntiCoronaVirus",
    "Logevity petition",
    "Logevity Scientific Resort",
    "LongevityCoin (LONG)",
    "Marketplace & NFTs",
    "Terms of Use",
    "Privacy Policy",
  ];

  final socialMediaAssets = [
    "assets/instagram-logo.svg",
    "assets/linked-in-logo.svg",
    "assets/facebook-logo.svg",
    "assets/twitter-logo.svg",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 25,
            ),
            SvgPicture.asset(
              "assets/logo.svg",
              color: const Color(0xff3683FC),
              height: 50,
            ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              "InTime BioTech LLC.",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 22,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "300 Delaware Avenue, Suite 210-A,Wilmington, Delaware, 19801, USA",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                // letterSpacing: 1,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              "Products & Services",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 21,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            ...productsList.map(
              (productName) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: AnimatedButton(
                  onTap: () {
                    launch("https://www.intime.digital/ru/");
                  },
                  child: Text(
                    productName,
                    style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        letterSpacing: 0.9,
                        color: Color(0xff3683FC)),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Contact Us",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 21,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            AnimatedButton(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.mail_outline_rounded,
                    color: Color(0xff3683FC),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "support@intime.digital",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        letterSpacing: 1,
                        color: Color(0xff3683FC)),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ...socialMediaAssets.reversed.map(
                    (asset) => AnimatedButton(
                      child: SvgPicture.asset(
                        asset,
                        color: const Color(0xff3683FC),
                        height: 18,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              "Powered by artificial intelligence, verified by scientists, generated by Big Data obtained from evidence based only clinical trials.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 12,
                // letterSpacing: 1,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              "Copyright © 2022, InTime BioTech  LLC.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                // letterSpacing: 1,
              ),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
