import 'package:flutter/material.dart';
import 'package:in_time_petition_demo/core/theme.dart';
import 'package:in_time_petition_demo/core/utils.dart';

import 'core/routes/global_routes.dart';

void main() {
  runApp(const PetitionApp());
}

class PetitionApp extends StatelessWidget {
  const PetitionApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Petition App',
      theme: AppTheme.themeData,
      navigatorKey: Utils.mainNavigatorKey,
      initialRoute: GlobalRoutes.core,
      onGenerateRoute: GlobalRoutes.onGenerateRoute,
    );
  }
}
