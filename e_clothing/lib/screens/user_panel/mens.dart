// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:e_clothing/screens/auth.ui/checkout.dart';
import 'package:e_clothing/utils/appconst.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'cart.dart';

// Model for clothing items
class ClothingItem {
  final String name;
  final double price;
  final String imageUrl;

  ClothingItem({
    required this.name,
    required this.price,
    required this.imageUrl,
  });
}

// Sample data for each clothing category
final List<ClothingItem> tShirts = [
  ClothingItem(name: "T-Shirt 1", price: 2000.00, imageUrl: "assets/t(1).jpg"),
  ClothingItem(name: "T-Shirt 2", price: 2500.00, imageUrl: "assets/t(5).jpg"),
  ClothingItem(name: "T-Shirt 3", price: 2355.00, imageUrl: "assets/t(3).jpg"),
];

final List<ClothingItem> shirts = [
  ClothingItem(name: "Shirt 1", price: 3500.00, imageUrl: "assets/shirt1.jpg"),
  ClothingItem(name: "Shirt 2", price: 4000.00, imageUrl: "assets/shirt3.jpg"),
  ClothingItem(name: "Shirt 3", price: 4600.00, imageUrl: "assets/shirts.jpg"),
];

final List<ClothingItem> trousers = [
  ClothingItem(name: "Trousers 1", price: 5000.00, imageUrl: "assets/tr1.jpg"),
  ClothingItem(name: "Trousers 2", price: 5500.00, imageUrl: "assets/tr2.jpg"),
  ClothingItem(name: "Trousers 3", price: 6500.00, imageUrl: "assets/tr4.jpg"),
];

final List<ClothingItem> shorts = [
  ClothingItem(name: "Shorts 1", price: 830.00, imageUrl: "assets/sh1.jpg"),
  ClothingItem(name: "Shorts 2", price: 935.00, imageUrl: "assets/sh2.jpg"),
  ClothingItem(name: "Shorts 3", price: 645.00, imageUrl: "assets/sh3.jpg"),
];

// final List<ClothingItem> caps = [
//   ClothingItem(name: "Cap 1", price: 15.0, imageUrl: "assets/cap1.jpg"),
//   ClothingItem(name: "Cap 2", price: 20.0, imageUrl: "assets/cap2.jpg"),

// ];

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Men\'s Clothing',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MenClothingScreen(),
    );
  }
}

class MenClothingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstant.appmaincolor,
        title: Text(
          'Men\'s Clothing',
          style: TextStyle(
            color: AppConstant.apptextcolor,
          ),
        ),
      ),
      backgroundColor: AppConstant.appsecondarycolor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/mens2.jpg',
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            buildCategoryCarousel('T-Shirts', tShirts),
            buildCategoryCarousel('Shirts', shirts),
            buildCategoryCarousel('Trousers', trousers),
            buildCategoryCarousel('Shorts', shorts),
            // buildCategoryCarousel('Caps', caps),
          ],
        ),
      ),
    );
  }

  Widget buildCategoryCarousel(String category, List<ClothingItem> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            category,
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: AppConstant.apptextcolor),
          ),
        ),
        CarouselSlider.builder(
          options: CarouselOptions(
            aspectRatio: 16 / 9,
            viewportFraction: 0.8,
            initialPage: 0,
            enableInfiniteScroll: true,
            // reverse: false,
            // autoPlay: true,
            // autoPlayInterval: Duration(seconds: 3),
            // autoPlayAnimationDuration: Duration(milliseconds: 800),
            // autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
          ),
          itemCount: items.length,
          itemBuilder: (BuildContext context, int index, int realIndex) {
            final item = items[index];
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => CheckoutPage(
                      price: item.price,
                      productName: item.name,
                    ),
                  ),
                );
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Stack(
                    children: [
                      Image.asset(
                        item.imageUrl,
                        fit: BoxFit.cover,
                        width: 400.0,
                      ),
                      Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(200, 0, 0, 0),
                                Colors.black
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.name,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Rs ${item.price.toStringAsFixed(2)}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
