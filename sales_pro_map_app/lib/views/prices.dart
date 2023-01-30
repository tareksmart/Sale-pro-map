import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:sales_pro_map_app/controller/prov.dart';
import 'package:sales_pro_map_app/services/database_controller.dart';
import 'package:sales_pro_map_app/utilities/constant.dart';
import 'package:sales_pro_map_app/views/widgets/card_price_item.dart';
import 'package:sales_pro_map_app/views/widgets/search_field.dart';
import '../model/product_price.dart';
import '../services/database_controller.dart';

class Prices extends StatefulWidget {
  Prices({super.key});

  @override
  State<Prices> createState() => _PricesState();
}

class _PricesState extends State<Prices> {
  late List<ProductPrices> pricesList = [];
  late List<ProductPrices> filterList = [];

  @override
  void initState() {
    super.initState();
  }

  void searchList(listedFilter) {
    filterList = listedFilter;
  }

  @override
  Widget build(BuildContext context) {
    //final database=Provider.of<Database>(context);
    final provider = Provider.of<prov>(context);
    Widget SearchWidget = SearchFiekd(
      priceList: pricesList.length > 0 ? pricesList : [],
      filterItemFunc: searchList,
    );
    bool _isSearched = true;
    //final database = FireStroreDataBase();
    return Scaffold(
      appBar: AppBar(
        title: _isSearched
            ? SearchWidget
            : Text(
                'Prices',
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: const Color(primaryColor)),
              ),
      ),
      body: Consumer<prov>(
        builder: (context, prov, child) => SizedBox(
            child: FutureBuilder<List<ProductPrices>>(
          future: prov.get(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              pricesList = snapshot.data!;
              return ListView.builder(
                  itemCount:100,
                  itemBuilder: (context, index) {
                    print('==================== search');

                    print(filterList.length);
                    return CardPrice(
                        productPrices: filterList.length > 0
                            ? filterList[index]
                            : pricesList[index]);
                  });
            }
            if (snapshot.hasError) {
              return Text('error');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        )),
      ),
    );
  }
}
