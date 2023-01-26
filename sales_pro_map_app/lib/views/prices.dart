import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:sales_pro_map_app/controller/prov.dart';
import 'package:sales_pro_map_app/services/database_controller.dart';
import '../model/product_price.dart';
import '../services/database_controller.dart';

class Prices extends StatelessWidget {
  const Prices({super.key});

  @override
  Widget build(BuildContext context) {
  //final database=Provider.of<Database>(context);
  
    //final database = FireStroreDataBase();
    return Scaffold(
      appBar: AppBar(),
      body: Provider<FireStroreDataBase>(
        create: (context) => FireStroreDataBase(),
        child: Consumer<FireStroreDataBase>(
          builder: (_,FireStroreDataBase,__) {
            return SizedBox(
                child: StreamBuilder<List<ProductPrices>>(
              stream: FireStroreDataBase.prices(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  final price = snapshot.data;
                  if (price == null) {
      print(price?.length.toString());print('================');
                    return CircularProgressIndicator();
                  }
                  return ListView(
                    children: price.map((e) {
                      print(e.itemName + "================"+"${price.length}");
                      return Text(e.itemName);
                    }).toList(),
                  );
                }
                return const Center(
                  child:CircularProgressIndicator(),
                );
              },
            ));
          }
        ),
      ),
    );
  }
}
