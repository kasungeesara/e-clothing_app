// ignore_for_file: file_names, sort_child_properties_last, prefer_const_constructors, unnecessary_import, unused_import, depend_on_referenced_packages


import 'package:e_clothing/screens/user_panel/mens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../utils/appconst.dart';
import 'accessories.dart';
import 'kids.dart';
import 'shoes.dart';
import 'womens.dart';

// ignore: camel_case_types
class allcategoryscreen extends StatefulWidget {
  const allcategoryscreen({super.key});

  @override
  State<allcategoryscreen> createState() => _allcategoryscreenState();
}

class _allcategoryscreenState extends State<allcategoryscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: AppConstant.appmaincolor,
        title: Text('All Categories',
        style: TextStyle(
          color: AppConstant.apptextcolor,
        ),
        ),
      ),
      // drawer: Sidebar(),
      backgroundColor: AppConstant.appsecondarycolor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                        child: Column(
                          children: [
                            Image.asset('assets/mens.jpg',
                            fit: BoxFit.cover,
                            height: 230,
                            width: 150,
                            ),
                            // Text('Men',
                            // style: TextStyle(
                            //   color: AppConstant.apptextcolor,
                            //   fontWeight: FontWeight.bold,
                            //   fontSize: 20,
                            // ),
                            // ),
                            TextButton(onPressed: (){
                              Navigator.push(context,
                               MaterialPageRoute(builder: (context) => MenClothingScreen())
                               );
                            }, 
                            child: Text("Mens",
                            style: TextStyle(
                              color: AppConstant.apptextcolor,
                            ),
                            ),),
                          ],
                        ),
                        width: 150,
                        height: 282,
                        decoration: BoxDecoration(
                          //color: Colors.amber,
                          border: Border.all(width: 2,color: Colors.black),
                          borderRadius: BorderRadius.circular(7),
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Image.asset('assets/women.jpg',
                            fit: BoxFit.cover,
                            height: 230,
                            width: 150,
                            ),
                            // Text('Women',
                            // style: TextStyle(
                            //   color: AppConstant.apptextcolor,
                            //   fontWeight: FontWeight.bold,
                            //   fontSize: 20,
                            // ),
                            // ),
                            TextButton(onPressed: (){
                              Navigator.push(context,
                               MaterialPageRoute(builder: (context) => womenscreen())
                               );
                            }, 
                            child: Text("Women",
                            style: TextStyle(
                              color: AppConstant.apptextcolor,
                            ),
                            ),),
                          ],
                        ),
                        width: 150,
                        height: 282,
                        decoration: BoxDecoration(
                          //color: Colors.amber,
                          borderRadius: BorderRadius.circular(7),
                          border: Border.all(width: 2,color: Colors.black),
                        ),
                      ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                        child: Column(
                          children: [
                            Image.asset('assets/kids.jpg',
                            height: 230,
                            width: 150,
                            fit: BoxFit.cover,
                            ),
                            // Text('Kids',
                            // style: TextStyle(
                            //   color: AppConstant.apptextcolor,
                            //   fontWeight: FontWeight.bold,
                            //   fontSize: 20,
                            // ),
                            // ),
                            TextButton(onPressed: (){
                              Navigator.push(context,
                               MaterialPageRoute(builder: (context) => kidscreen())
                               );
                            }, 
                            child: Text("Kids",
                            style: TextStyle(
                              color: AppConstant.apptextcolor,
                            ),
                            ),),
                          ],
                        ),
                        width: 150,
                        height: 282,
                        decoration: BoxDecoration(
                          //color: Colors.amber,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(width: 2,color: Colors.black),
                        ),
                      ),
                        Container(
                        child: Column(
                          children: [
                            Image.asset('assets/items.jpg',
                            height: 230,
                            width: 150,
                            fit: BoxFit.cover,
                            ),
                            // Text('Accessories',
                            // style: TextStyle(
                            //   color: AppConstant.apptextcolor,
                            //   fontWeight: FontWeight.bold,
                            //   fontSize: 20,
                            // ),
                            // ),
                            TextButton(onPressed: (){
                              Navigator.push(context,
                               MaterialPageRoute(builder: (context) => accescreen())
                               );
                            }, 
                            child: Text("Accessories",
                            style: TextStyle(color:AppConstant.apptextcolor),
                            ),
                            ),
                          ],
                        ),
                        width: 150,
                        height: 282,
                        decoration: BoxDecoration(
                          //color: Colors.amber,
                          border: Border.all(width: 2,color: Colors.black),
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                        child: Column(
                          children: [
                            Image.asset('assets/shoes1.jpg',
                            height: 230,
                            width: 150,
                            fit: BoxFit.cover,
                            ),
                            // Text('Kids',
                            // style: TextStyle(
                            //   color: AppConstant.apptextcolor,
                            //   fontWeight: FontWeight.bold,
                            //   fontSize: 20,
                            // ),
                            // ),
                            TextButton(onPressed: (){
                              Navigator.push(context,
                               MaterialPageRoute(builder: (context) => shoescreen())
                               );
                            }, 
                            child: Text("Shoes",
                            style: TextStyle(
                              color: AppConstant.apptextcolor,
                            ),
                            ),),
                          ],
                        ),
                        width: 150,
                        height: 282,
                        decoration: BoxDecoration(
                          //color: Colors.amber,
                          border: Border.all(width: 2,color: Colors.black),
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      //   Container(
                      //   child: Column(
                      //     children: [
                      //       Image.asset('assets/gym.jpg',
                      //       height: 230,
                      //       width: 150,
                      //       fit: BoxFit.cover,
                      //       ),
                      //       // Text('Accessories',
                      //       // style: TextStyle(
                      //       //   color: AppConstant.apptextcolor,
                      //       //   fontWeight: FontWeight.bold,
                      //       //   fontSize: 20,
                      //       // ),
                      //       // ),
                      //       TextButton(onPressed: (){
                      //         // Navigator.push(context,
                      //         //  MaterialPageRoute(builder: (context) => MenClothingScreen())
                      //         //  );
                      //       }, 
                      //       child: Text("Gym Wear",
                      //       style: TextStyle(color:AppConstant.apptextcolor),
                      //       ),
                      //       ),
                      //     ],
                      //   ),
                      //   width: 150,
                      //   height: 282,
                      //   decoration: BoxDecoration(
                      //     //color: Colors.amber,
                      //     border: Border.all(width: 2,color: Colors.black),
                      //     borderRadius: BorderRadius.circular(5),
                      //   ),
                      // ),
                ],
              ),
            ),
          ],
          
        ),
      ),
    );
  }
}