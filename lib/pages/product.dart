import 'package:flutter/material.dart';
import 'dart:async';
import 'package:scoped_model/scoped_model.dart';

import '../widgets/ui_elements/title_default.dart';

import '../scoped-models/products.dart';
import '../models/product.dart';

class ProductPage extends StatelessWidget {
  final int productIndex;

  ProductPage(this.productIndex);

  _showWarningDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Are you sure?'),
          content: Text('This action cannot be undone'),
          actions: <Widget>[
            FlatButton(
              child: Text('DISCARD'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            FlatButton(
              child: Text('CONTINUE'),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context, true);
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildAddressAndPriceRow(double price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Lagos, Nigera',
          style: TextStyle(
            fontFamily: 'Lato',
            color: Colors.grey,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 5.0, right: 5.0),
          child: Text(
            '|',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
        Text(
          '\$' + price.toString(),
          style: TextStyle(
            fontFamily: 'Lato',
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildDescriptionContainer(String description) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 10.0,
      ),
      alignment: Alignment.center,
      child: Text(
        description,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildTitleContainer(String title) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: TitleDefault(title),
    );
  }

  Widget _buildPageBodyColumn(
    String title,
    String description,
    String image,
    double price,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Image.asset(image),
        _buildTitleContainer(title),
        _buildAddressAndPriceRow(price),
        _buildDescriptionContainer(description),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: () {
      print('Back button pressed');
      Navigator.pop(context, false);
      return Future.value(false);
    }, child: ScopedModelDescendant<ProductsModel>(
      builder: (
        BuildContext context,
        Widget child,
        ProductsModel model,
      ) {
        final Product product = model.products[productIndex];
        return Scaffold(
          appBar: AppBar(
            title: Text(product.title),
          ),
          body: _buildPageBodyColumn(
            product.title,
            product.description,
            product.image,
            product.price
          ),
        );
      },
    ));
  }
}
