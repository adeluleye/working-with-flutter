import 'package:flutter/material.dart';

class ProductControl extends StatelessWidget {

  final Function addProduct;

  ProductControl(this.addProduct);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Color.fromRGBO(233, 109, 32, 1.0),
      onPressed: () {
        addProduct({'title': 'Chocolate', 'image': 'assets/chemistry.jpg'});
      },
      child: Text(
        'Add Something',
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
      ),
    );
  }
}
