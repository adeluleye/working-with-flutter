import 'package:flutter/material.dart';

class ProductCreatePage extends StatefulWidget {
  final Function addProduct;

  ProductCreatePage(this.addProduct);

  @override
  State<StatefulWidget> createState() {
    return _ProductCreatePageState();
  }
}

class _ProductCreatePageState extends State<ProductCreatePage> {
  String _titleValue = '';
  String _descriptionValue = '';
  double _priceValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
      child: ListView(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              labelText: 'Product Title',
            ),
            onChanged: (String value) {
              setState(() {
                _titleValue = value;
              });
            },
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Product Description'),
            maxLines: 3,
            onChanged: (String value) {
              setState(() {
                _descriptionValue = value;
              });
            },
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Product Price'),
            keyboardType: TextInputType.numberWithOptions(
              decimal: true,
            ),
            onChanged: (String value) {
              setState(() {
                _priceValue = double.parse(value);
              });
            },
          ),
          SizedBox(
            height: 10.0,
          ),
          RaisedButton(
            color: Colors.deepOrange,
            textColor: Colors.black,
            child: Text(
              'Save',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            onPressed: () {
              final Map<String, dynamic> product = {
                'title': _titleValue,
                'description': _descriptionValue,
                'price': _priceValue,
                'image': 'assets/chemistry.jpg'
              };
              widget.addProduct(product);
              Navigator.pushReplacementNamed(context, '/products');
            },
          )
        ],
      ),
    );
  }
}