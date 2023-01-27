import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sales_pro_map_app/model/product_price.dart';
import 'package:sales_pro_map_app/utilities/constant.dart';

class SearchFiekd extends StatelessWidget {
  SearchFiekd({super.key, required this.priceList});
  TextEditingController _searchControler = TextEditingController();
   List<ProductPrices> priceList;
   late List<ProductPrices> filterList;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Placeholder(
        child: TextFormField(
          decoration: InputDecoration(
              hintText: 'find price',
              hintStyle: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: const Color(accentColor))),
          onChanged: (priceName) {
            filterList = priceList
                .where((element) =>
                    element.ItemName.toLowerCase().startsWith(priceName))
                .toList();
            item_prices(filterList, priceName.isEmpty ? false : true);
          },
        ),
      ),
    );
  }

  static List<ProductPrices> item_prices(filterList, bool isSearch) {
    if(isSearch){
      return filterList;
    }
    else
    return [];
  }
}
