import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _contactController = TextEditingController();
  final _birthDateController = TextEditingController();
  final _passwordController = TextEditingController();
  final _retypePasswordController = TextEditingController();

  DateTime? _selectedDate;

  void _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
        _birthDateController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
      });
    }
  }

  void _register() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushNamed(context, '/home');
    }
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
          // Registration form
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: width * 0.05, vertical: height * 0.05),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Sign-up',
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: height * 0.02),
                  Text(
                    'Contacts (phone/mail):',
                    style: TextStyle(color: Colors.white),
                  ),
                  TextFormField(
                    controller: _contactController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[300]?.withOpacity(0.5),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your contact information';
                      }
                      // Check if input is email or numeric
                      if (!RegExp(r'^[0-9]+$').hasMatch(value) &&
                          !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                        return 'Please enter a valid email or phone number';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: height * 0.02),
                  Text(
                    'Birth date:',
                    style: TextStyle(color: Colors.white),
                  ),
                  TextFormField(
                    controller: _birthDateController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[300]?.withOpacity(0.5),
                    ),
                    onTap: () {
                      _selectDate(context);
                    },
                    readOnly: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select your birth date';
                      }
                      return null;
                    },
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a password';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: height * 0.02),
                  Text(
                    'Re-input Password:',
                    style: TextStyle(color: Colors.white),
                  ),
                  TextFormField(
                    controller: _retypePasswordController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[300]?.withOpacity(0.5),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value != _passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: height * 0.04),
                  Center(
                    child: SizedBox(
                      width: width * 0.6, // Reduce the width of the button
                      child: ElevatedButton(
                        onPressed: _register,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.brown,
                          padding: EdgeInsets.symmetric(vertical: height * 0.02),
                        ),
                        child: Text(
                          'Register',
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
                          Navigator.pushNamed(context, '/login');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.brown,
                          padding: EdgeInsets.symmetric(vertical: height * 0.02),
                        ),
                        child: Text(
                          'Sign-in',
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
