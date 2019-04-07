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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildTitleTextField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Product Title',
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Title is required';
        }
      },
      onSaved: (String value) {
        setState(() {
          _titleValue = value;
        });
      },
    );
  }

  Widget _buildDescriptionTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Product Description'),
      maxLines: 3,
      onSaved: (String value) {
        setState(() {
          _descriptionValue = value;
        });
      },
    );
  }

  Widget _buildPriceTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Product Price'),

      keyboardType: TextInputType.numberWithOptions(
        decimal: true,
      ),
      onSaved: (String value) {
        setState(() {
          _priceValue = double.parse(value);
        });
      },
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
    final Map<String, dynamic> product = {
      'title': _titleValue,
      'description': _descriptionValue,
      'price': _priceValue,
      'image': 'assets/chemistry.jpg'
    };
    widget.addProduct(product);
    Navigator.pushReplacementNamed(context, '/products');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
      child: Form(
        key: _formKey,
        child: _buildListView(),
      ),
    );
  }
}
