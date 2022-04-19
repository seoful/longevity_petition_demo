import 'package:flutter/material.dart';
import 'package:in_time_petition_demo/components/animated_button.dart';
import 'package:in_time_petition_demo/components/votes_progress_bar.dart';
import 'package:in_time_petition_demo/core/strings.dart';
import 'package:in_time_petition_demo/core/utils.dart';

import '../../core/routes/global_routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late AssetImage image;

  @override
  void initState() {
    image = AssetImage("assets/evening-by-seaside.png");
    super.initState();
  }

  @override
  void didChangeDependencies() {
    precacheImage(image, context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Stack(
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return LinearGradient(
                        begin: FractionalOffset.center,
                        end: FractionalOffset.bottomCenter,
                        colors: [
                          Colors.grey.withOpacity(0.0),
                          Colors.white.withOpacity(1),
                        ],
                        stops: const [0.0, 1.0],
                      ).createShader(bounds);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fitWidth,
                            alignment: FractionalOffset.topCenter,
                            image: image),
                      ),
                    ),
                    blendMode: BlendMode.srcATop,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 25),
                  child: Text(
                    "Longevity\nPetition",
                    style: TextStyle(
                        height: 1.3,
                        letterSpacing: 1.2,
                        fontSize: 26,
                        fontWeight: FontWeight.w500,
                        color: Colors.white.withOpacity(0.96)),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: VotesProgressBar(
                currentBarValue: 97563,
                fullBarValue: 200000,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                Strings.supportResearch,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black.withOpacity(0.8),
                    letterSpacing: 1),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            AnimatedButton(
              onTap: () {},
              child: ExpansionTile(
                tilePadding: const EdgeInsets.symmetric(horizontal: 30),
                childrenPadding: const EdgeInsets.symmetric(horizontal: 40),
                trailing: const Icon(Icons.add_rounded),
                title: Text(
                  "Know More",
                  style: TextStyle(
                      letterSpacing: 1,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.black.withOpacity(0.8)),
                ),
                children: [
                  Text(
                    Strings.knowMoreIntro,
                    style: TextStyle(
                        // letterSpacing: 1,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black.withOpacity(0.8)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    Strings.petitionMoreInfo,
                    style: TextStyle(
                        // letterSpacing: 1,
                        height: 1.3,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.black.withOpacity(0.8)),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 90,
            ),
          ],
        ),
        Positioned(
          left: 20,
          right: 20,
          bottom: 20,
          child: AnimatedButton(
            onTap: () {
              Utils.mainNavigatorKey.currentState
                  ?.pushNamed(GlobalRoutes.petition);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Utils.accentColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 3,
                    blurRadius: 10,
                  ),
                ],
              ),
              height: 50,
              child: const Center(
                child: Text(
                  "Sign It Now!",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
