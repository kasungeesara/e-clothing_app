// ignore_for_file: depend_on_referenced_packages, camel_case_types

import 'package:flutter/material.dart';
import '../../utils/appconst.dart';

class welcomescreen extends StatelessWidget {
  const welcomescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: AppConstant.appsecondarycolor,
        appBar: AppBar(
          backgroundColor: AppConstant.appmaincolor,
          title: const Text('KGK STORE',
          style:TextStyle(
            color: AppConstant.apptextcolor,
            fontSize: 30,
            
          ) ,
          ),
        ),
        body: Column(
          children: [
            const Center(
              child: Padding(
                padding: EdgeInsets.only(top: 80),
                child: Text('HAPPY SHOPPING',
                style:TextStyle(
                  color: Color.fromARGB(255, 255, 193, 7),
                  fontSize: 35,
                ),
                ),
              ),
            ),
            Image.asset('assets/smile2.png',height: 400,width: 400,),
            const SizedBox(height: 30,),
            Container(
              height: 70,
              width: 300,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 250, 249, 249),
                borderRadius: BorderRadius.circular(40),
              ),
              child: TextButton.icon(onPressed: (){}, icon: Image.asset('assets/google.png',height: 40,width: 40,), label: const Text('sign in with google',style: TextStyle(color: Colors.black,fontSize: 20,),)),
            ),
            const SizedBox(height: 40,),
            Container(
              height: 70,
              width: 300,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 250, 249, 249),
                borderRadius: BorderRadius.circular(40),
              ),
              child: TextButton.icon(onPressed: (){}, icon: Image.asset('assets/email.jpg',height: 40,width: 40,), label: const Text('sign in with email',style: TextStyle(color: Colors.black,fontSize: 20,),)),
            ),
          ],
        ),
      ),
    );
  }
}