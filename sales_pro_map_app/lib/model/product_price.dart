import 'dart:convert';

class ProductPrices {
  final int ItemId;
  final String ItemName;
  final double ItemSellPriceGo;
  ProductPrices({required this.ItemId,required this.ItemName,required this.ItemSellPriceGo});



  Map<String, dynamic> toMap() {
    return {
      'ItemId': this.ItemId,
      'ItemName': this.ItemName,
      'ItemSellPriceGo': this.ItemSellPriceGo,
    };
  }

  factory ProductPrices.fromMap(Map<String, dynamic> map) {
    return ProductPrices(
      ItemId: map['ItemId'] ??0,
      ItemName: map['ItemName'] ??'666',
      ItemSellPriceGo: map['ItemSellPriceGo']??0.0,
    );
  }
}
