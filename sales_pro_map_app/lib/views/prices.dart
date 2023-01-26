import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:sales_pro_map_app/controller/prov.dart';
import 'package:sales_pro_map_app/services/database_controller.dart';
import 'package:sales_pro_map_app/utilities/constant.dart';
import 'package:sales_pro_map_app/views/widgets/card_price_item.dart';
import '../model/product_price.dart';
import '../services/database_controller.dart';

class Prices extends StatelessWidget {
  const Prices({super.key});

  @override
  Widget build(BuildContext context) {
    //final database=Provider.of<Database>(context);

    //final database = FireStroreDataBase();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Prices',
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(color: const Color(primaryColor)),
        ),
      ),
      body: ChangeNotifierProvider<prov>(
        lazy: true,
        create: (context) => prov(path: itemsCollection),
        child: Consumer<prov>(builder: (_, prov, __) {
          return SizedBox(
              child: FutureBuilder<List<ProductPrices>>(
            future: prov.get(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final pricesList = snapshot.data;
                return ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      return CardPrice(productPrices: pricesList![index]);
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
          ));
        }),
      ),
    );
  }
}
