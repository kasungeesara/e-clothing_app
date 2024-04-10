
// ignore_for_file: depend_on_referenced_packages, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import '../../utils/appconst.dart';
import 'signup.dart';


class signinscreen extends StatefulWidget {
  const signinscreen({super.key});

  @override
  State<signinscreen> createState() => _signinscreenState();
}

class _signinscreenState extends State<signinscreen> {
  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(
       builder: (context, isKeyboardVisible){
         return Scaffold(
          appBar: AppBar(
            backgroundColor: AppConstant.appmaincolor,
        title: const Text('Sign In',
        style: TextStyle(color:AppConstant.apptextcolor,fontSize: 30,),
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
          Padding(
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
                const SizedBox(height: 5),
                ElevatedButton(
                  onPressed: () {
                    // Perform sign-in action
                  },
                  child: const Text('Sign In'),
                ),
                const SizedBox(height: 5),
                TextButton(
                  onPressed: () {
                    // Navigate to forgot password page
                  },
                  child: const Text('Forgot Password?',
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
              MaterialPageRoute(builder: (context) => const SignUpScreen())
                    );
                  },
                  child: const Text('Don\'t have an account? Sign Up',
                  
                  style:TextStyle(
                    fontSize: 20,
                    color: AppConstant.apptextcolor,
                  ) ,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      );
     }
    );
  }
}
