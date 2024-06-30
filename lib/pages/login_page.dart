import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
    Navigator.pushNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/sbuc.jpg'), // Replace with your image asset path
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Dark shade overlay
          Container(
            color: Colors.black.withOpacity(0.6),
          ),
          // Login form
          Padding(
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
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: height * 0.04),
                  Text(
                    'Name:',
                    style: TextStyle(color: Colors.white),
                  ),
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[300]?.withOpacity(0.5),
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  Text(
                    'Password:',
                    style: TextStyle(color: Colors.white),
                  ),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[300]?.withOpacity(0.5),
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: height * 0.04),
                  Center(
                    child: SizedBox(
                      width: width * 0.6, // Reduce the width of the button
                      child: ElevatedButton(
                        onPressed: _isButtonDisabled ? null : _login,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.brown,
                          padding: EdgeInsets.symmetric(vertical: height * 0.02),
                        ),
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  Text(
                    'or',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: height * 0.02),
                  Center(
                    child: SizedBox(
                      width: width * 0.6, // Reduce the width of the button
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/register');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.brown,
                          padding: EdgeInsets.symmetric(vertical: height * 0.02),
                        ),
                        child: Text(
                          'Sign-up',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
