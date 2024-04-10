import 'package:flutter/material.dart';

import '../../utils/appconst.dart';
import 'signin.dart';

void main() {
  runApp(const SignUpScreen());
}

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            backgroundColor:AppConstant.appmaincolor ,
        title: const Text('Sign Up',
        style: TextStyle(
          color:AppConstant.apptextcolor,
        fontSize: 30,
        ),
        ),
      ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/signup1.jpg"),
              fit: BoxFit.cover,
            ),
          ),
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
                ),
                const SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Username',
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.5),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Phone',
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.5),
                  ),
                ),
                 const SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'City',
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.5),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.5),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 76, 74, 66),
                  ),
                  onPressed: () {
                    // Implement sign-up functionality here
                  },
                  child: const Text('Sign Up',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const signinscreen())
                    );
                  },
                  child: const Text('Already have an account? Sign In',
                  
                  style:TextStyle(
                    fontSize: 20,
                    color: AppConstant.apptextcolor,
                  ) ,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
