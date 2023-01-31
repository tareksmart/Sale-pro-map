import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:sales_pro_map_app/services/database_controller.dart';
import 'package:sales_pro_map_app/utilities/constant.dart';
import 'package:sales_pro_map_app/utilities/routes.dart';
import 'package:sales_pro_map_app/views/prices.dart';
import 'package:sales_pro_map_app/views/widgets/card.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});
  get() async {
    print('inside float');
    var coll = FirebaseFirestore.instance.collection('items');
    print('col $coll');
    var snap = await coll.get();
    print('snap ${snap.docs[0].data().values}');
    snap.docs.map((e) {
      print(e.data().values);
      print('============================goooooooooo');
    });
  }

  @override
  Widget build(BuildContext context) {
    final database=Provider.of<Database>(context);
    return Scaffold(
        body: SafeArea(
         child: SingleChildScrollView(
           child: Padding(
             padding:
                 const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
             child: Column(
               children: [
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     SizedBox.square(
                       dimension: 100,
                       child: Image.network(
                         image,
                         fit: BoxFit.cover,
                       ),
                     ),
                     Column(
                       children: [
                         const Text('Good Morning'),
                         const SizedBox(
                           height: 16,
                         ),
                         Text(
                           'Tarek Rabeia',
                           style: Theme.of(context)
                               .textTheme
                               .headlineMedium!
                               .copyWith(color: Colors.black),
                         )
                       ],
                     ),
                     IconButton(
                         onPressed: () {}, icon: const Icon(Icons.window))
                   ],
                 ),
                 const SizedBox(
                   height: 40,
                 ),
                 CardItem(
                     tab: () {},
                     imageHeight: .2,
                     imageWidth: double.infinity,
                     heightBox: .3,
                     image: imageLogo,
                     widthBox: 1,
                     title: 'Sales Pro'),
                 const SizedBox(
                   height: 16,
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     CardItem(
                         tab: () {
                           Navigator.of(context)
                               .pushNamed(AppRoutes.prices,arguments: {'database':database});
                         },
                         imageHeight: .15,
                         imageWidth: double.infinity,
                         heightBox: .3,
                         image: imageSales,
                         widthBox: .45,
                         title: 'Sales'),
                     CardItem(
                         tab: () {},
                         imageHeight: .2,
                         imageWidth: double.infinity,
                         heightBox: .3,
                         image: imageIncome,
                         widthBox: .45,
                         title: 'Income'),
                   ],
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     CardItem(
                         tab: () {},
                         imageHeight: .2,
                         imageWidth: double.infinity,
                         heightBox: .3,
                         image: imageSpent,
                         widthBox: .45,
                         title: 'Spent'),
                     CardItem(
                         tab: () {},
                         imageHeight: .2,
                         imageWidth: double.infinity,
                         heightBox: .3,
                         image: imageDept,
                         widthBox: .45,
                         title: 'Dept'),
                   ],
                 ),
               ],
             ),
           ),
         ),
            ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => get(),
        ));
  }
}
