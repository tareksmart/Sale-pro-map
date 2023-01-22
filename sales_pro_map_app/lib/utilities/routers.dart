import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sales_pro_map_app/utilities/routes.dart';

import '../views/widgets/home_page.dart';

class Routers{
  static Route<dynamic> onGenerateRoute(RouteSettings settings){
    switch (settings.name) {
      case AppRoutes.homePage:
      return MaterialPageRoute(builder: (_)=>Homepage());
        default:
       return MaterialPageRoute(builder: (_)=>Homepage());
    }
  }
}