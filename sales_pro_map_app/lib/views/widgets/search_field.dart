import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sales_pro_map_app/model/product_price.dart';
import 'package:sales_pro_map_app/utilities/constant.dart';

class SearchFiekd extends StatefulWidget {
  SearchFiekd({super.key, required this.priceList,required this.filterItemFunc});
  List<ProductPrices> priceList;
   List<ProductPrices> filterList=[];
Function (List<ProductPrices> filterList)filterItemFunc;
  @override
  State<SearchFiekd> createState() => _SearchFiekdState();

   List<ProductPrices> item_prices(bool isSearch) {
    if (isSearch) {
      return filterList;
    } else
      return [];
  }
}

class _SearchFiekdState extends State<SearchFiekd> {
  TextEditingController _searchControler = TextEditingController();

  

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: TextFormField(
        decoration: InputDecoration(
            hintText: 'find price',
            hintStyle: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: const Color(accentColor))),
        onChanged: (priceName) {
          if (priceName.trim() != "") {
            widget.filterList = widget.priceList
                .where((element) =>
                    element.ItemName.toLowerCase().startsWith(priceName))
                .toList();
          widget.filterItemFunc(widget.filterList);
          
          }
        },
      ),
    );
  }

 
}
