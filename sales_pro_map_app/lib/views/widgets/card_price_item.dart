import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sales_pro_map_app/model/product_price.dart';
import 'package:sales_pro_map_app/utilities/constant.dart';
import 'package:sales_pro_map_app/utilities/constant.dart';

class CardPrice extends StatelessWidget {
  CardPrice({required this.productPrices});
  final ProductPrices productPrices;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
       
       
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                productPrices.ItemId.toString(),
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: const Color(primaryText)),
              ),
              Text(
                productPrices.ItemName,
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: const Color(primaryText)),
              ),
              Text(
                productPrices.ItemSellPriceGo.toString(),
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: const Color(primaryText)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
