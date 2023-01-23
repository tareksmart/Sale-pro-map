import 'dart:convert';

class ProductPrices {
  final int itemId;
  final String itemName;
  final double itemPrice;
  ProductPrices(this.itemId, this.itemName, this.itemPrice);
  Map<String, dynamic> toMap() {
    return {
      'itemId': itemId,
      'itemName': itemName,
      'itemPrice': itemPrice,
    };
  }
  factory ProductPrices.fromMap(Map<String, dynamic> map) {
    return ProductPrices(
      map['itemId']?.toInt() ?? 0,
      map['itemName'] ?? '',
      map['itemPrice']?.toDouble() ?? 0.0,
    );
  }
  String toJson() => json.encode(toMap());
  factory ProductPrices.fromJson(String source) => ProductPrices.fromMap(json.decode(source));
}
