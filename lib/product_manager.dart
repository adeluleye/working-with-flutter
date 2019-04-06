import 'package:flutter/material.dart';

import './products.dart';
import './product_control.dart';

class ProductManager extends StatelessWidget {
  final List<Map<String, String>> products;
  final Function addProduct;
  final Function deleteProduct;

  ProductManager(this.products, this.addProduct, this.deleteProduct);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(2.0, 4.0, 2.0, 4.0),
          child: ProductControl(addProduct),
        ),
        Container(
          height: 700.0,
          child: Products(products, deleteProduct: deleteProduct),
        )
      ],
    );
  }
}
