import 'package:sales_pro_map_app/model/product_price.dart';
import 'package:sales_pro_map_app/model/sales_model.dart';
import 'package:sales_pro_map_app/services/fire_store_service.dart';

abstract class Database {
  Stream<List<ProductPrices>> prices(String search);
  Stream<List<SalesModel>> sales();
}

class FireStroreDataBase implements Database {
  final _service = FireStoreServices.instance;
  @override
  Stream<List<ProductPrices>> prices(search) {
    var x = _service.collectionStream(
        path: 'items',
        builder: ((data, documentId) =>
            ProductPrices.fromMap(data as Map<String, dynamic>)),
        queryBuilder: (query) {
          if (search.trim().length > 0) {
            return query
                .where('ItemName', isGreaterThanOrEqualTo: search)
                .limit(1);
          } else {
            return query;
          }
        });

    return x;
  }

  @override
  Stream<List<SalesModel>> sales() {
    return _service.collectionStream(
        path: 'sales',
        builder: ((data, documentId) =>
            SalesModel.fromMap(data as Map<String, dynamic>)),
       );

   
  }
}
