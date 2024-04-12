// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, camel_case_types

import 'package:e_clothing/screens/auth.ui/checkout.dart';
import 'package:e_clothing/utils/appconst.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
final List<ClothingItem> sunglass = [
  ClothingItem(name: "Sunglass 1", price: 2000.0, imageUrl: "assets/sun1.jpg"),
  ClothingItem(name: "Sunglass 2", price: 2500.0, imageUrl: "assets/sun2.jpg"),
  ClothingItem(name: "Sunglass 3", price: 5500.0, imageUrl: "assets/sun3.jpg"),
];

final List<ClothingItem> watch = [
  ClothingItem(name: "Watch 1", price: 3500.0, imageUrl: "assets/wt1.jpg"),
  ClothingItem(name: "Watch 2", price: 4000.0, imageUrl: "assets/wt3.jpg"),
  ClothingItem(name: "Watch 3", price: 4600.0, imageUrl: "assets/wt2.jpg"),
];

final List<ClothingItem> earing = [
  ClothingItem(name: "Earing 1", price: 850.0, imageUrl: "assets/er1.jpg"),
  ClothingItem(name: "Earing 2", price: 955.0, imageUrl: "assets/er2.jpg"),
  ClothingItem(name: "Earing 3", price: 765.0, imageUrl: "assets/er3.jpg"),
];

// final List<ClothingItem> Skirts = [
//   ClothingItem(name: "skirts 1", price: 30.0, imageUrl: "assets/sk1.jpg"),
//   ClothingItem(name: "skirts 2", price: 35.0, imageUrl: "assets/sk2.jpg"),
//   ClothingItem(name: "skirts 3", price: 45.0, imageUrl: "assets/sk3.jpg"),
// ];

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
      title: 'Accessories',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: accescreen(),
    );
  }
}

class accescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstant.appmaincolor,
        title: Text(
          'Accessories',
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
              'assets/acce.jpg',
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            buildCategoryCarousel('SUNGLASSES', sunglass),
            buildCategoryCarousel('WATCHES', watch),
            buildCategoryCarousel('EARINGS', earing),
            // buildCategoryCarousel('Skirts', Skirts),
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
