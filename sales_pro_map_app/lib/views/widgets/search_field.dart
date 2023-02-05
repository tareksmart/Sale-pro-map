import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sales_pro_map_app/model/product_price.dart';
import 'package:sales_pro_map_app/utilities/constant.dart';

class SearchFiekd extends StatefulWidget {
  SearchFiekd(
      {super.key, required this.filterItemFunc});
 
  String search = '';
  Function(String search) filterItemFunc;
  @override
  State<SearchFiekd> createState() => _SearchFiekdState();
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
            widget.filterItemFunc(priceName);
          }
        },
      ),
    );
  }
}
