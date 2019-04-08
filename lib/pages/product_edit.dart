import 'package:flutter/material.dart';

import '../widgets/helpers/ensure-visible.dart';

import '../models/product.dart';

class ProductEditPage extends StatefulWidget {
  final Function addProduct;
  final Function updateProduct;
  final Product product;
  final int productIndex;

  ProductEditPage(
      {this.addProduct, this.updateProduct, this.product, this.productIndex});

  @override
  State<StatefulWidget> createState() {
    return _ProductEditPageState();
  }
}

class _ProductEditPageState extends State<ProductEditPage> {
  final Map<String, dynamic> _formData = {
    'title': null,
    'description': null,
    'price': null,
    'image': 'assets/chemistry.jpg'
  };
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _titleFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _priceFocusNode = FocusNode();

  Widget _buildTitleTextField() {
    return EnsureVisibleWhenFocused(
      focusNode: _titleFocusNode,
      child: TextFormField(
        focusNode: _titleFocusNode,
        decoration: InputDecoration(
          labelText: 'Product Title',
        ),
        initialValue: widget.product == null ? '' : widget.product.title,
        validator: (String value) {
          if (value.isEmpty || value.length < 5) {
            return 'Title is required and should be minimum of 5 Xters';
          }
        },
        onSaved: (String value) {
          _formData['title'] = value;
        },
      ),
    );
  }

  Widget _buildDescriptionTextField() {
    return EnsureVisibleWhenFocused(
      focusNode: _descriptionFocusNode,
      child: TextFormField(
        focusNode: _descriptionFocusNode,
        decoration: InputDecoration(labelText: 'Product Description'),
        maxLines: 3,
        initialValue: widget.product == null ? '' : widget.product.description,
        validator: (String value) {
          if (value.isEmpty || value.length < 10) {
            return 'Description required, min of 10 Xters';
          }
        },
        onSaved: (String value) {
          _formData['description'] = value;
        },
      ),
    );
  }

  Widget _buildPriceTextField() {
    return EnsureVisibleWhenFocused(
      focusNode: _priceFocusNode,
      child: TextFormField(
        focusNode: _priceFocusNode,
        decoration: InputDecoration(labelText: 'Product Price'),
        keyboardType: TextInputType.numberWithOptions(
          decimal: true,
        ),
        initialValue:
            widget.product == null ? '' : widget.product.price.toString(),
        validator: (String value) {
          if (value.isEmpty ||
              !RegExp(r'^(?:[1-9]\d*|0)?(?:\.\d+)?$').hasMatch(value)) {
            return 'Price is required and should be a number';
          }
        },
        onSaved: (String value) {
          _formData['price'] = double.parse(value);
        },
      ),
    );
  }

  Widget _buildSizedBox() {
    return SizedBox(
      height: 10.0,
    );
  }

  Widget _buildSaveButton() {
    return RaisedButton(
      //color: Colors.deepOrange,
      textColor: Colors.black,
      child: Text(
        'Save',
        style: TextStyle(
          color: Colors.white,
          fontSize: 14,
        ),
      ),
      onPressed: _submitForm,
    );
  }

  Widget _buildGestureDetector() {
    return GestureDetector(
      onTap: _submitForm,
      child: Container(
        color: Colors.green,
        padding: EdgeInsets.all(5.0),
        child: Text('My Button'),
      ),
    );
  }

  Widget _buildListView() {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 828.0 ? 800 : deviceWidth * 0.95;
    final double targetPadding = deviceWidth - targetWidth;
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: targetPadding / 2),
      children: <Widget>[
        _buildTitleTextField(),
        _buildDescriptionTextField(),
        _buildPriceTextField(),
        _buildSizedBox(),
        _buildSaveButton()
        //_buildGestureDetector(),
      ],
    );
  }

  void _submitForm() {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    if (widget.product == null) {
      widget.addProduct(Product(
        title: _formData['title'],
        description: _formData['description'],
        price: _formData['price'],
        image: _formData['image'],
      ));
    } else {
      widget.updateProduct(
        widget.productIndex,
        Product(
          title: _formData['title'],
          description: _formData['description'],
          price: _formData['price'],
          image: _formData['image'],
        ),
      );
    }
    Navigator.pushReplacementNamed(context, '/products');
  }

  Widget _buildPageContent(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
        child: Form(
          key: _formKey,
          child: _buildListView(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Widget pageContent = _buildPageContent(context);
    return widget.product == null
        ? pageContent
        : Scaffold(
            appBar: AppBar(
              title: Text('Edit Product'),
            ),
            body: pageContent,
          );
  }
}
