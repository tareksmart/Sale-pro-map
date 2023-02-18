import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sales_pro_map_app/utilities/constant.dart';

class CardItem extends StatelessWidget {
  final double heightBox;
  final double widthBox;
  final String image;
  final String title;
  final String subTitle;
  final double imageHeight;
  final double imageWidth;
  VoidCallback? tab;
  CardItem(
      {super.key,
      required this.heightBox,
      required this.image,
      required this.widthBox,
      required this.title,
      required this.subTitle,
      required this.imageHeight,
      required this.imageWidth,
      required this.tab});

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
          shadowColor: buttonColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
          elevation: 16,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
                height: 10,
              ),
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(color: primaryTextColor),
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                subTitle,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Color(accentColor)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
