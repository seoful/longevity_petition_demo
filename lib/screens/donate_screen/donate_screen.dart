import 'package:flutter/material.dart';
import 'package:in_time_petition_demo/core/routes/donate_routes.dart';

import '../../core/utils.dart';

class DonateScreen extends StatelessWidget {
  const DonateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Column(
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
                            image: AssetImage("assets/make-a-change.jpg"))),
                  ),
                  blendMode: BlendMode.srcATop,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 30, left: 25),
                child: Text(
                  "Donate",
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Navigator(
                key: Utils.donateNavigatorKey,
                onGenerateRoute: DonateRoutes.onGenerateRoute,
                initialRoute: DonateRoutes.choosePaymentMethod,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
