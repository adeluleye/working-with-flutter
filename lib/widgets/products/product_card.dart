import 'package:flutter/material.dart';

import './price_tag.dart';
import './address_tag.dart';
import '../ui_elements/title_default.dart';

class ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;
  final int productIndex;

  ProductCard(this.product, this.productIndex);

  Widget _buildTitleAndPriceContainer() {
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TitleDefault(
            product['title'],
          ),
          SizedBox(
            width: 8.0,
          ),
          PriceTag(product['price'].toString())
        ],
      ),
    );
  }

  Widget _buildButtonBar(BuildContext context) {
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.info),
          color: Theme.of(context).primaryColor,
          iconSize: 20,
          onPressed: () => Navigator.pushNamed<bool>(
              context, '/product/' + productIndex.toString()),
        ),
        IconButton(
          icon: Icon(Icons.favorite_border),
          color: Colors.red,
          iconSize: 20,
          onPressed: () => Navigator.pushNamed<bool>(
              context, '/product/' + productIndex.toString()),
        ),
      ],
    );
  }

  Widget _buildCardColumn(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.asset(product['image']),
        _buildTitleAndPriceContainer(),
        AddressTag('Lagos, Nigeria'),
        _buildButtonBar(context)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: _buildCardColumn(context),
    );
  }
}
