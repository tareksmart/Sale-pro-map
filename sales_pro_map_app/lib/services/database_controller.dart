import 'package:sales_pro_map_app/model/product_price.dart';
import 'package:sales_pro_map_app/services/fire_store_service.dart';

abstract class Database {
  Stream<List<ProductPrices>> prices();
}

class FireStroreDataBase implements Database {
  final _service = FireStoreServices.instance;
  @override
  Stream<List<ProductPrices>> prices() {
    return _service.collectionStream(
        path: 'items/',
        builder: ((data, documentId) =>
            ProductPrices.fromMap(data as Map<String, dynamic>)));
  }
}
