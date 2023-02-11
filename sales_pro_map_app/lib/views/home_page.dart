import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:sales_pro_map_app/services/database_controller.dart';
import 'package:sales_pro_map_app/utilities/constant.dart';
import 'package:sales_pro_map_app/utilities/routes.dart';
import 'package:sales_pro_map_app/views/prices.dart';
import 'package:sales_pro_map_app/widgets/drawer.dart';
import '../../widgets/card.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});
  get() async {
    print('inside float');
    var coll = FirebaseFirestore.instance.collection('sales');
    print('col $coll');
    var snap = await coll.get();
    print('snap ${snap.docs[0].data()}');
    snap.docs.map((e) {
      print(e.data().values);
      print('============================goooooooooo');
    });
  }

  @override
  Widget build(BuildContext context) {
    final database = Provider.of<Database>(context);
    final size = MediaQuery.of(context).size;
    GlobalKey<ScaffoldState> scaffolKey = GlobalKey<ScaffoldState>();
    return Scaffold(
     backgroundColor: Theme.of(context).primaryColor,
      key: scaffolKey,
      drawer: MyDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox.square(
                      dimension: 100,
                      child: Image.network(
                        FirebaseAuth.instance.currentUser!.photoURL??image,
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
                         FirebaseAuth.instance.currentUser?.displayName??"anonymous",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: Colors.black),
                        )
                      ],
                    ),
                    IconButton(
                        onPressed: () {
                          scaffolKey.currentState!.openDrawer();
                        },
                        icon: const Icon(Icons.window))
                  ],
                ),
                const SizedBox(
                  height: 38,
                ),
                CardItem(
                  tab: () {
                    get();
                  },
                  imageHeight: size.height * .0002,
                  imageWidth: double.infinity,
                  heightBox: .29,
                  image: imageLogo,
                  widthBox: 1,
                  title: 'Sales Pro',
                  subTitle: '',
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Provider<Database>(
                      create: (context) => FireStroreDataBase(),
                      child: CardItem(
                          tab: () {
                            Navigator.of(context)
                                .pushNamed(AppRoutes.salesChart);
                          },
                          imageHeight: size.height * .00007,
                          imageWidth: size.width * .0002,
                          heightBox: .25,
                          image: imageSales,
                          widthBox: .45,
                          title: 'Sales',
                          subTitle: 'Displying total last sales'),
                    ),
                    Provider<Database>(
                      create: (context) => FireStroreDataBase(),
                      child: CardItem(
                          tab: () {
                            Navigator.of(context)
                                .pushNamed(AppRoutes.creditChart);
                          },
                          imageHeight: size.height * .00007,
                          imageWidth: size.width * .0002,
                          heightBox: .25,
                          image: imageIncome,
                          widthBox: .45,
                          title: 'Credites',
                          subTitle: 'Displying total last Credites'),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Provider<Database>(
                      create: (context) => FireStroreDataBase(),
                      child: CardItem(
                          tab: () {
                            Navigator.of(context)
                                .pushNamed(AppRoutes.spentChart);
                          },
                          imageHeight: size.height * .00007,
                          imageWidth: size.width * .0002,
                          heightBox: .25,
                          image: imageSpent,
                          widthBox: .45,
                          title: 'Spent',
                          subTitle: 'Displying total last spent'),
                    ),
                    Provider<Database>(
                      create: (context) => FireStroreDataBase(),
                      child: CardItem(
                          tab: () {
                            Navigator.of(context).pushNamed(AppRoutes.prices);
                          },
                          imageHeight: size.height * .00007,
                          imageWidth: size.width * .0002,
                          heightBox: .25,
                          image: imageDept,
                          widthBox: .45,
                          title: 'Prices',
                          subTitle: 'Displying all last Prices'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
