import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sales_pro_map_app/model/product_price.dart';
import 'package:sales_pro_map_app/services/database_controller.dart';
import 'package:sales_pro_map_app/services/fire_store_service.dart';

class prov with ChangeNotifier {
  final String path;
  var list;
  prov({required this.path});
  final _service = FirebaseFirestore.instance;
  final _service2 = FireStoreServices.instance;
  Future<List<ProductPrices>> get() async {
    final col = _service.collection(path);
    final docs = await col.get();
    
   
    list = docs.docs.map((e) {
      // print('==================');
      // print(e.data());

      return ProductPrices.fromMap(e.data());
    }).toList();
    notifyListeners();

    return list;
  }

  Stream<List<ProductPrices>> getStream() {
    var x = _service2.collectionStream(
        path: 'items',
        builder: ((data, documentId) =>
            ProductPrices.fromMap(data as Map<String, dynamic>)));
    print('==================');
    print(x);

    return x;
  }
}
