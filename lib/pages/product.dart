import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Product Detail'),
        ),
        body: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/chemistry.jpg'),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text('Details!'),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: RaisedButton(
                color: Colors.deepPurple,
                child: Text(
                  'BACK',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold
                  ),
                ),
                onPressed: () => Navigator.pop(context),
              ),
            )
          ],
        ));
  }
}
