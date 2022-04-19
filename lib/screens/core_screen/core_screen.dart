import 'package:flutter/material.dart';
import 'package:in_time_petition_demo/components/expandable_top_menu.dart';
import 'package:in_time_petition_demo/core/routes/pages_routes.dart';
import 'package:in_time_petition_demo/core/strings.dart';
import 'package:in_time_petition_demo/core/utils.dart';

import '../../components/animated_button.dart';
import '../../core/routes/global_routes.dart';

class CoreScreen extends StatefulWidget {
  const CoreScreen({Key? key}) : super(key: key);

  @override
  State<CoreScreen> createState() => _CoreScreenState();
}

class _CoreScreenState extends State<CoreScreen> {
  final screens = <String, String>{
    Strings.home: PagesRoutes.home,
    Strings.updates: PagesRoutes.updates,
    Strings.supporters: PagesRoutes.supporters,
    Strings.donate: PagesRoutes.donate,
    Strings.about_us: PagesRoutes.aboutUs,
  };

  var currentScreen = Strings.home;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Column(
          children: [
            ExpandableTopMenu(
              titles: screens.keys.toList(),
              initialTitle: currentScreen,
              onTitleTap: (newScreen) {
                setState(() {
                  currentScreen = newScreen;
                });
                Utils.pagesNavigatorKey.currentState
                    ?.pushReplacementNamed(screens[newScreen]!);
              },
              trailing: AnimatedButton(
                onTap: () {
                  Utils.mainNavigatorKey.currentState
                      ?.pushNamed(GlobalRoutes.petition);
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
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
                  // height: 30,
                  child: const Center(
                    child: Text(
                      "Sign Petition",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 12),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 5,
                      blurRadius: 10,
                      offset: const Offset(0, -3), // changes position of shadow
                    ),
                  ],
                ),
                width: MediaQuery.of(context).size.width,
                child: Navigator(
                  key: Utils.pagesNavigatorKey,
                  initialRoute: PagesRoutes.home,
                  onGenerateRoute: PagesRoutes.onGenerateRoute,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
