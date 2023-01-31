import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sales_pro_map_app/model/product_price.dart';

import '../utilities/constant.dart';

final _service = FirebaseFirestore.instance;
 var list1=[];
Future<List<FutureList>> getPrices() async {
  final col = _service.collection(itemsCollection);
  final docs = await col.get();
 
  list1 = docs.docs.map((e) {
    return ProductPrices.fromMap(e.data());
  }).toList();
  var x = FutureList();
  return x.get();
}

class FutureList {
  FutureList();
   List<ProductPrices> list2 = list1 as List<ProductPrices>;
  get() {
    return this.list2;
  }
}
