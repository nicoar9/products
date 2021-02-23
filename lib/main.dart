import 'package:flutter/material.dart' hide Router;
import 'package:products_app/app/locator.dart';
import 'package:products_app/ui/views/views.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app/router.gr.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: HomeView(),
      onGenerateRoute: Router(),
      navigatorKey: StackedService.navigatorKey,
    );
  }
}
