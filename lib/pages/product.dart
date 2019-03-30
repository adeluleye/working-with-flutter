import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Product Detail'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text(
                'Details!',
                textAlign: TextAlign.center,
              ),
            ),
            RaisedButton(
              child: Text('BACK'),
              onPressed: () => Navigator.pop(context),
            )
          ],
        ));
  }
}
