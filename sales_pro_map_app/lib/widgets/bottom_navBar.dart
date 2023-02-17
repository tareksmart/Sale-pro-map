import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MySnackbar extends StatelessWidget {
  MySnackbar({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Placeholder(
        child: SnackBar(
          // animation: AnimationMin,
      content: Text(message),
      duration: Duration(seconds: 10),
      padding: EdgeInsets.all(10),
      action: SnackBarAction(label: 'Close', onPressed: (){}),
    ));
  }
}
