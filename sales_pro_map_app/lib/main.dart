import 'package:flutter/material.dart';
import 'package:sales_pro_map_app/utilities/constant.dart';
import 'package:sales_pro_map_app/utilities/routers.dart';
import 'package:sales_pro_map_app/utilities/routes.dart';
import 'package:sales_pro_map_app/utilities/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Routers.onGenerateRoute,
      initialRoute: AppRoutes.homePage,
      title: 'Sales Pro Map',
      theme: ThemeData(
          scaffoldBackgroundColor: const Color(primaryColor),
          primarySwatch: Colors.green,
          primaryColor: const Color(primaryColor),
          primaryColorDark: const Color(primaryColorDark)),
    );
  }
}
