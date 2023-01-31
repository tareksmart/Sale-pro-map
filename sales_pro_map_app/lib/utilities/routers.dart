import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sales_pro_map_app/controller/future_provider.dart';
import 'package:sales_pro_map_app/controller/prov.dart';
import 'package:sales_pro_map_app/services/database_controller.dart';
import 'package:sales_pro_map_app/utilities/constant.dart';
import 'package:sales_pro_map_app/utilities/routes.dart';
import 'package:sales_pro_map_app/views/prices.dart';

import '../views/home_page.dart';

class Routers {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.homePage:
        return MaterialPageRoute(builder: (_) => Homepage());
      case AppRoutes.prices:
        return MaterialPageRoute(
            builder: (_) => Provider<Database>(
                create: (context) => prov(path: itemsCollection),
                child: Prices(),lazy: true,));
      default:
        return MaterialPageRoute(builder: (_) => Homepage());
    }
  }
}
