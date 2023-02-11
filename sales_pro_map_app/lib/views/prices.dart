import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:sales_pro_map_app/controller/prov.dart';
import 'package:sales_pro_map_app/services/database_controller.dart';
import 'package:sales_pro_map_app/utilities/constant.dart';
import '../../widgets/card_price_item.dart';
import '../../widgets/search_field.dart';
import '../model/product_price.dart';
import '../services/database_controller.dart';

class Prices extends StatefulWidget {
  Prices({super.key});

  @override
  State<Prices> createState() => _PricesState();
}

class _PricesState extends State<Prices> {
  late List<ProductPrices> pricesList = [];
  String filtersearch = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void searchList(String searchItem) {
    setState(() {
      filtersearch = searchItem;
    });
  }

  int rebuild = 0;
  @override
  Widget build(BuildContext context) {
    final database = Provider.of<Database>(context);

    Widget SearchWidget = SearchFiekd(
      filterItemFunc: searchList,
    );
    bool _isSearched = true;

    return Scaffold(
      appBar: AppBar(
        title: _isSearched
            ? SearchWidget
            : Text(
                'Prices',
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: primaryTextColor),
              ),
      ),
      body: SizedBox(
        child: StreamBuilder<List<ProductPrices>>(
          stream: database.prices(filtersearch),
          builder: (context, snapshot) {
           
            rebuild++;
          //  pricesList.clear();
            print('rebuild =====================');
            print(rebuild);
            if (snapshot.hasData) {
              pricesList = snapshot.data!;
              if (pricesList.length <= 0) {
                return const Center(
                  child: Text('no data is available'),
                );
              }
              return ListView.builder(
                itemCount: pricesList.length,
                itemBuilder: (context, index) {
               
                  return CardPrice(productPrices: pricesList[index]);
                },
              );
            }
            if (snapshot.hasError) {
              return const Text('error');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
