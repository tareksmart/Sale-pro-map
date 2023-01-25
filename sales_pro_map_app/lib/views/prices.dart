import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import '../model/product_price.dart';
import '../services/database_controller.dart';

class Prices extends StatelessWidget {
  const Prices({super.key});

  @override
  Widget build(BuildContext context) {
    // final database = Provider.of<Database>(context);
    final database = FireStroreDataBase();
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
          child: StreamBuilder<List<ProductPrices>>(
        stream: database.prices(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final price = snapshot.data;
            if (price == null) {
              return CircularProgressIndicator();
            }
            return ListView(
              children: price.map((e) {
                print(e.itemName + "================");
                return ListTile(title: Text(e.itemName));
              }).toList(),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      )),
    );
  }
}
