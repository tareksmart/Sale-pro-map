import 'package:flutter/material.dart';
import 'package:sales_pro_map_app/model/product_price.dart';
import 'package:sales_pro_map_app/services/database_controller.dart';

class prov with ChangeNotifier {
  final Database database = FireStroreDataBase();
  Stream<List<ProductPrices>> fun(){
   return database.prices();
    notifyListeners();
  }
}
