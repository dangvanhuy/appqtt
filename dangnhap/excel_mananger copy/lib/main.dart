import 'package:excel_mananger/pages/login.screen.dart';
import 'package:excel_mananger/service/locator.service.dart';
import 'package:excel_mananger/service/navigator.service.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await locatorService();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: getIt.get<NavigationService>().navigationKey,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}
