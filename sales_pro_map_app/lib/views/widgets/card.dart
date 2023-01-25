import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CardItem extends StatelessWidget {
  final double heightBox;
  final double widthBox;
  final String image;
  final String title;
  final double imageHeight;
  final double imageWidth;
  VoidCallback? tab;
   CardItem(
      {super.key,
      required this.heightBox,
      required this.image,
      required this.widthBox,
      required this.title,
      required this.imageHeight,
      required this.imageWidth,required this.tab});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * heightBox,
      width: size.width * widthBox,
      child: InkWell(
        onTap: tab,
        child: Card(
          color: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
          elevation: 16,
          child: Column(
            children: [
              SizedBox(
                height: size.height * imageHeight,
                width: double.infinity,
                child: Image.network(
                  image,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
              )
            ],
          ),
        ),
      ),
    );
  }
}
