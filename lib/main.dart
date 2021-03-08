import 'package:flutter/material.dart' hide Router;
import 'package:products_app/app/locator.dart';
import 'package:products_app/services/user_preferences.dart';
import 'package:products_app/ui/views/views.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app/router.gr.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new UserPreferences();
  await prefs.initPrefs();
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final prefs = UserPreferences();
    print(prefs.token);

    return MaterialApp(
      title: 'Material App',
      home: LoginView(),
      onGenerateRoute: Router(),
      navigatorKey: StackedService.navigatorKey,
      theme: ThemeData(primaryColor: Colors.deepPurple),
    );
  }
}
