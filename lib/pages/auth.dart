import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {
  String _emailValue;
  String _passwordValue;
  bool _acceptTerms = false;

  DecorationImage _buildBackgroundImage() {
    return DecorationImage(
      fit: BoxFit.cover,
      colorFilter:
          ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.dstATop),
      image: AssetImage('assets/main_background.png'),
    );
  }

  Widget _buildEmailTextField() {
    return TextField(
      decoration: InputDecoration(
          labelText: 'Email Address', filled: true, fillColor: Colors.white),
      keyboardType: TextInputType.emailAddress,
      onChanged: (String value) {
        setState(() {
          _emailValue = value;
        });
      },
    );
  }

  Widget _buildPasswordTextField() {
    return TextField(
      decoration: InputDecoration(
          labelText: 'Password', filled: true, fillColor: Colors.white),
      keyboardType: TextInputType.text,
      obscureText: true,
      onChanged: (String value) {
        setState(() {
          _passwordValue = value;
        });
      },
    );
  }

  Widget _buildAcceptTermsSwitch() {
    return SwitchListTile(
      value: _acceptTerms,
      onChanged: (bool value) {
        setState(() {
          _acceptTerms = value;
        });
      },
      title: Text(
        'Accept our Terms of use',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _buildLoginButton() {
    return RaisedButton(
      color: Colors.deepOrange,
      textColor: Colors.white,
      child: Text('Authenticate'),
      onPressed: _submitPressed,
    );
  }

  Widget _buildSizedBox() {
    return SizedBox(
      height: 10.0,
    );
  }

  Widget _buildSingleChildScrollView() {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 828.0 ? 500.0 : deviceWidth * 0.95;
    return SingleChildScrollView(
      child: Container(
        width: targetWidth,
        child: Column(
          children: <Widget>[
            _buildEmailTextField(),
            _buildSizedBox(),
            _buildPasswordTextField(),
            _buildAcceptTermsSwitch(),
            _buildSizedBox(),
            _buildLoginButton()
          ],
        ),
      ),
    );
  }

  Widget _buildAppBodyContainer() {
    return Container(
      decoration: BoxDecoration(
        image: _buildBackgroundImage(),
      ),
      padding: EdgeInsets.all(10.0),
      child: Center(
        child: _buildSingleChildScrollView(),
      ),
    );
  }

  void _submitPressed() {
    //print(this._emailValue + ':' + this._passwordValue);
    Navigator.pushReplacementNamed(context, '/products');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: _buildAppBodyContainer(),
    );
  }
}
