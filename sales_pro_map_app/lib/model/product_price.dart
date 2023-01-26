import 'dart:convert';

class ProductPrices {
  final int itemId;
  final String itemName;
  final double itemPrice;
  ProductPrices({required this.itemId,required this.itemName,required this.itemPrice});

  String toJson() => json.encode(toMap());
  factory ProductPrices.fromJson(String source) => ProductPrices.fromMap(json.decode(source));

  Map<String, dynamic> toMap() {
    return {
      'itemId': this.itemId,
      'itemName': this.itemName,
      'itemPrice': this.itemPrice,
    };
  }

  factory ProductPrices.fromMap(Map<String, dynamic> map) {
    return ProductPrices(
      itemId: map['itemId'] as int,
      itemName: map['itemName'] as String,
      itemPrice: map['itemPrice'] as double,
    );
  }
}
