import 'package:flutter/material.dart';
import 'dart:async';

class ProductPage extends StatelessWidget {
  final String title;
  final String imageUrl;

  ProductPage(this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          print('Back button pressed');
          Navigator.pop(context, false);
          return Future.value(false);
        },
        child: Scaffold(
            appBar: AppBar(
              title: Text(title),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(imageUrl),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Text(title),
                ),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: RaisedButton(
                    color: Colors.deepPurple,
                    child: Text(
                      'DELETE',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    onPressed: () => Navigator.pop(context, true),
                  ),
                )
              ],
            )));
  }
}