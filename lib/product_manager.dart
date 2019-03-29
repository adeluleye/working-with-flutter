import 'package:flutter/material.dart';

import './products.dart';

class ProductManager extends StatefulWidget {

  final String startingProduct;

  ProductManager(this.startingProduct);

  @override
  State<StatefulWidget> createState() {
    return _ProductManagerState();
  }
}

class _ProductManagerState extends State<ProductManager> {
  List<String> _products = [];

  @override
  void initState() {
    super.initState();
    _products.add(widget.startingProduct);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(2.0, 4.0, 2.0, 4.0),
          child: RaisedButton(
            color: Color.fromRGBO(233, 109, 32, 1.0),
            onPressed: () {
              setState(() {
                _products.add('Vocational Teaching');
              });
            },
            child: Text(
              'Add Something', 
              textAlign: TextAlign.center, 
              style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Products(_products)
      ],
    );
  }
}
