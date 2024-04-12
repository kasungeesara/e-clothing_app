import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import '../../utils/appconst.dart';
import 'signup.dart';

final _firebase = FirebaseAuth.instance;

class signinscreen extends StatefulWidget {
  const signinscreen({super.key});

  @override
  State<signinscreen> createState() => _signinscreenState();
}

class _signinscreenState extends State<signinscreen> {
  final _form = GlobalKey<FormState>();
  var email = "";
  var password = "";
  var _isAuthenticating = false;

  void _submit() async {
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }

    FocusScope.of(context).unfocus();
    _form.currentState!.save();

    setState(() {
      _isAuthenticating = true;
    });

    try {
      await _firebase.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (error) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.message ?? "Signup faild"),
        ),
      );
      setState(() {
        _isAuthenticating = false;
      });
      return;
    }
    setState(() {
      _isAuthenticating = false;
    });

  }

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: AppConstant.appmaincolor,
          title: const Text(
            'Sign In',
            style: TextStyle(
              color: AppConstant.apptextcolor,
              fontSize: 30,
            ),
          ),
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            // Background Image
            Image.asset(
              'assets/signup1.jpg', // Replace with your image path
              fit: BoxFit.cover,
            ),
            Form(
              key: _form,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.5),
                      ),
                      onSaved: (value) {
                        email = value!;
                      },
                      validator: (value) {
                        if (value == null ||
                            value.trim().isEmpty ||
                            !value.contains("@")) {
                          return "Enter a valid email";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.5),
                      ),
                      onSaved: (value) {
                        password = value!;
                      },
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Enter a password";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 5),
                    ElevatedButton(
                      onPressed: _submit,
                      child: const Text('Sign In'),
                    ),
                    const SizedBox(height: 5),
                    TextButton(
                      onPressed: () {
                        // Navigate to forgot password page
                      },
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(
                          fontSize: 20,
                          color: AppConstant.apptextcolor,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpScreen()));
                      },
                      child: const Text(
                        'Don\'t have an account? Sign Up',
                        style: TextStyle(
                          fontSize: 20,
                          color: AppConstant.apptextcolor,
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
    });
  }
}
