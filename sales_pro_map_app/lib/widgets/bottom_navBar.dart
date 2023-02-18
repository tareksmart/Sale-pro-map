import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sales_pro_map_app/utilities/constant.dart';

class MySnackbar extends StatelessWidget {
  MySnackbar({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      backgroundColor: primaryColor,
      animation: const AlwaysStoppedAnimation<double>(1),
      content: Text(
        message,
        style: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(color: primaryTextColor),
      ),
      padding: EdgeInsets.all(10),
      action: SnackBarAction(
          label: 'Close',
          onPressed: () {
            Navigator.of(context).pop();
          }),
      behavior: SnackBarBehavior.floating,
    );
  }
}
