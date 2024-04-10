// ignore_for_file: use_key_in_widget_constructors, camel_case_types

import 'package:e_clothing/utils/appconst.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(tshirtscreen());
}

class tshirtscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: AppConstant.appsecondarycolor,
        appBar: AppBar(
        backgroundColor: AppConstant.appmaincolor,
        
        title: Text('T-shirts',
        style: TextStyle(
          color: AppConstant.apptextcolor,
        ),
        ),
      ),
        body: tshirts(),
      ),
    );
  }
}

class tshirts extends StatelessWidget {
  final List<Shoe> shoes = [
    Shoe(imageUrl: 'assets/t(6).jpg', price: 'Rs 2000.00'),
    Shoe(imageUrl: 'assets/t(4).jpg', price: 'Rs 3500.00'),
    Shoe(imageUrl: 'assets/t(3).jpg', price: 'Rs 4000.00'),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
        childAspectRatio: 0.75,
      ),
      itemCount: shoes.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            // Handle tap on shoe
            print('Tapped on ${shoes[index].price}');
          },
          child: Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Image.asset(
                    shoes[index].imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    shoes[index].price,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class Shoe {
  final String imageUrl;
  final String price;

  Shoe({required this.imageUrl, required this.price});
}
