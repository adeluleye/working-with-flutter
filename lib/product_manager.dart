import 'package:flutter/material.dart';

import './products.dart';

class ProductManager extends StatelessWidget {
  final List<Map<String, dynamic>> products;

  ProductManager(this.products);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 700.0,
          child: Products(products),
        )
      ],
    );
  }
}
