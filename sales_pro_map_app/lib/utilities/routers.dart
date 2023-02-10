import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sales_pro_map_app/controller/future_provider.dart';
import 'package:sales_pro_map_app/controller/prov.dart';
import 'package:sales_pro_map_app/services/database_controller.dart';
import 'package:sales_pro_map_app/utilities/constant.dart';
import 'package:sales_pro_map_app/utilities/routes.dart';
import 'package:sales_pro_map_app/views/credit_chart.dart';
import 'package:sales_pro_map_app/views/log_in_page.dart';
import 'package:sales_pro_map_app/views/prices.dart';
import 'package:sales_pro_map_app/views/sales_chart.dart';
import 'package:sales_pro_map_app/widgets/drawer.dart';
import '../views/spent_chart.dart';

import '../views/home_page.dart';

class Routers {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.homePage:
        {
          return MaterialPageRoute(builder: (_) => Homepage());
        }
      case AppRoutes.prices:
        {
          return MaterialPageRoute(builder: (_) => Prices());
        }
      case AppRoutes.salesChart:
        return MaterialPageRoute(builder: (_) => const SalesChart());
      case AppRoutes.creditChart:
        return MaterialPageRoute(builder: (_) => const CreditChart());

         case AppRoutes.spentChart:
        return MaterialPageRoute(builder: (_) => const SpentChart());
         case AppRoutes.logInPage:
        return MaterialPageRoute(builder: (_) => const  LogInPage());
          case AppRoutes.verifyEmail:
        return MaterialPageRoute(builder: (_) => const  EmailVerificationScreen());
          case AppRoutes.profile:
        return MaterialPageRoute(builder: (_) => const  ProfileScreen());
         case AppRoutes.drawer:
        return MaterialPageRoute(builder: (_) => const  MyDrawer());
      default:
        return MaterialPageRoute(builder: (_) =>const Homepage());
    }
  }
}
