import 'package:flutter/material.dart';

import '../product_manager.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DemoApp'),
      ),
      //body: Column(children: [ProductManager(startingProduct: 'Robotics and AI')]),
      body: Column(children: [ProductManager()]),
    );
  }
}
