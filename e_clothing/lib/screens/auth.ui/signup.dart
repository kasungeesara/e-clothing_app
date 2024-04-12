import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../utils/appconst.dart';

final _firebase = FirebaseAuth.instance;

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _form = GlobalKey<FormState>();
  var _enteredEmail = "";
  var userName = "";
  var phoneNumber = "";
  var city = "";
  var _enteredPasword = "";
  var _isAuthenticaing = false;
  var errorMsg = "";

  void _submit() async {
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }

    FocusScope.of(context).unfocus();
    _form.currentState!.save();

    setState(() {
      _isAuthenticaing = true;
    });

    print(_enteredEmail + ".................................");
    print(_enteredPasword + ".................................");

    try {
      print("try block start................................................");
      final userCredentials = await _firebase.createUserWithEmailAndPassword(
          email: _enteredEmail , password: _enteredPasword);

          print("User created................................................");
          print("Data sending................................................");

      await FirebaseFirestore.instance
          .collection("users")
          .doc(userCredentials.user!.uid)
          .set({
        "userName": userName,
        "phoneNumber": phoneNumber,
        "city": city,
        "email": _enteredEmail,
      });

      print("Data Sent................................................");

      _form.currentState!.reset();
    } on FirebaseAuthException catch (error) {
      print("error................................................");
      if (error.code == "email-already-in-use") {
        errorMsg = "Email adderss is already in use";
      } else if (error.code == "invalid-email") {
        errorMsg = "Email adderss is not valid";
      }

      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).clearSnackBars();
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMsg),
        ),
      );
      setState(() {
        _isAuthenticaing = false;
      });
      return;
    }
    FirebaseAuth.instance.signOut();
    setState(() {
      _isAuthenticaing = false;
    });

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: AppConstant.appmaincolor,
          title: const Text(
            'Sign Up',
            style: TextStyle(
              color: AppConstant.apptextcolor,
              fontSize: 30,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            height: 775,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/signup1.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Form(
              key: _form,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.5),
                      ),
                      onSaved: (value) {
                        _enteredEmail = value!;
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
                      decoration: InputDecoration(
                        labelText: 'Username',
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.5),
                      ),
                      onSaved: (value) {
                        userName = value!;
                      },
                      validator: (value) {
                        if (value == null ||
                            value.trim().isEmpty ||
                            value.trim().length < 5) {
                          return "Enter a user name containes at least 6 characters";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Phone',
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.5),
                      ),
                      onSaved: (value) {
                        phoneNumber = value!;
                      },
                      validator: (value) {
                        if (value == null ||
                            value.trim().isEmpty ||
                            value.trim().length != 10) {
                          return "Enter a valid contact number";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'City',
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.5),
                      ),
                      onSaved: (value) {
                        city = value!;
                      },
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Enter a city name";
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
                        _enteredPasword = value!;
                      },
                      validator: (value) {
                        if (value == null ||
                            value.trim().isEmpty ||
                            value.trim().length < 5) {
                          return "Enter a password at least 6 characters";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    if (!_isAuthenticaing)
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 76, 74, 66),
                        ),
                        onPressed: _submit,
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    if (_isAuthenticaing)
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 76, 74, 66),
                        ),
                        onPressed: _submit,
                        child: const CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Already have an account? Sign In',
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
          ),
        ),
      ),
    );
  }
}
