import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.person),
             
              Column(
                children: [
                  const Text('Good Morning'),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text('Tarek Rabeia')
                ],
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.window_rounded))
            ],
          ),
        ),
      )),
    );
  }
}
