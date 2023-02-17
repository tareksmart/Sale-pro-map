import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sales_pro_map_app/controller/prov.dart';
import 'package:sales_pro_map_app/model/product_price.dart';
import 'package:sales_pro_map_app/services/database_controller.dart';
import 'package:sales_pro_map_app/utilities/constant.dart';
import 'package:sales_pro_map_app/utilities/routers.dart';
import 'package:sales_pro_map_app/utilities/routes.dart';
import 'package:sales_pro_map_app/utilities/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseUIAuth.configureProviders([
    EmailAuthProvider(),

    // ... other providers
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
String get initialRoute {
    final auth = FirebaseAuth.instance;

    if (auth.currentUser == null || auth.currentUser!.isAnonymous) {
      return AppRoutes.logInPage;
    }

    if (auth.currentUser!.displayName==null && auth.currentUser!.email != null) {
      return AppRoutes.profile;
    }

    return AppRoutes.profile;
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return Provider<Database>(
      create: (_) => FireStroreDataBase(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: Routers.onGenerateRoute,
          initialRoute:initialRoute //FirebaseAuth.instance.currentUser == null
        //    ? AppRoutes.logInPage
        //    : AppRoutes.homePage,
        ,
        title: 'Sales Pro Map',
        theme: ThemeData(
          brightness: Brightness.light,
          inputDecorationTheme: const InputDecorationTheme(
            border: OutlineInputBorder(),
          ),
        ),
      ),
    );
  }
}
