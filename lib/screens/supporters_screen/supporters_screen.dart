import 'package:flutter/material.dart';
import 'package:in_time_petition_demo/model/supporter_text.dart';

class SupportersScreen extends StatelessWidget {
  const SupportersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final supporters = [
      SupporterText("Martin O’Dea",
          "Most important issues there is. If we weren't programmed to accept and someone explained that something potentially treatable.was killing.more than 100k.people a day after years or suffering we would stop at nothing to find the cures"),
      SupporterText("Martin O’Dea",
          "Most important issues there is. If we weren't programmed to accept and someone explained that something potentially treatable.was killing.more than 100k.people a day after years or suffering we would stop at nothing to find the cures"),
      SupporterText("Martin O’Dea",
          "Most important issues there is. If we weren't programmed to accept and someone explained that something potentially treatable.was killing.more than 100k.people a day after years or suffering we would stop at nothing to find the cures"),
    ];

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fitWidth,
                            alignment: FractionalOffset.topCenter,
                            image: AssetImage("assets/couple-kissing.jpg"))),
                  ),
                  blendMode: BlendMode.srcATop,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 30, left: 25),
                child: Text(
                  "Supporters",
                  style: TextStyle(
                      height: 1.3,
                      letterSpacing: 1.2,
                      fontSize: 27,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                ...supporters.map(
                  (supporterItem) => Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.grey,
                              child: Icon(
                                Icons.person,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              supporterItem.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 21,
                                letterSpacing: 1,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          supporterItem.text,
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            letterSpacing: 0.9,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
