import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final Color bisque = Color(0xFFFFE4C4);
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isButtonDisabled = true;

  void _checkIfButtonShouldBeEnabled() {
    setState(() {
      _isButtonDisabled = _nameController.text.isEmpty || _passwordController.text.isEmpty;
    });
  }

  @override
  void initState() {
    super.initState();
    _nameController.addListener(_checkIfButtonShouldBeEnabled);
    _passwordController.addListener(_checkIfButtonShouldBeEnabled);
  }

  @override
  void dispose() {
    _nameController.removeListener(_checkIfButtonShouldBeEnabled);
    _passwordController.removeListener(_checkIfButtonShouldBeEnabled);
    _nameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    // Add your login logic here
    Navigator.pushNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: bisque,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Sign-in',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: height * 0.05,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: height * 0.04),
              Text('Name:'),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[300],
                ),
              ),
              SizedBox(height: height * 0.02),
              Text('Password:'),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[300],
                ),
                obscureText: true,
              ),
              SizedBox(height: height * 0.04),
              ElevatedButton(
                onPressed: _isButtonDisabled ? null : _login,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown,
                  padding: EdgeInsets.symmetric(vertical: height * 0.02),
                ),
                child: Text('Login'),
              ),
              SizedBox(height: height * 0.02),
              Text(
                'or',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: height * 0.02),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/registration');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown,
                  padding: EdgeInsets.symmetric(vertical: height * 0.02),
                ),
                child: Text('Sign-up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
