// ignore_for_file: unused_field, unnecessary_cast, unused_import, library_private_types_in_public_api

import 'package:e_clothing/screens/user_panel/shirt.dart';
import 'package:e_clothing/screens/user_panel/trousers.dart';
import 'package:flutter/material.dart';

import '../screens/user_panel/accessories.dart';
import '../screens/user_panel/kids.dart';
import '../screens/user_panel/mens.dart';
import '../screens/user_panel/womens.dart';

class CategoryCarousel extends StatefulWidget {
  const CategoryCarousel({super.key});

  @override
  _CategoryCarouselState createState() => _CategoryCarouselState();
}

class _CategoryCarouselState extends State<CategoryCarousel> {
  int _currentIndex = 0;
  final List<String> _imageUrls = [
    'assets/trousers.jpg',
    'assets/shirts.jpg',
    'assets/saree.jpg',
  ];
  final List<String> _categoryNames = [
    'Trousers',
    'Shirts',
    'Saree',
  ];
  final List<String> _categoryprices = [
    'Rs.3000-Rs.5000',
    'Rs.1000-Rs.5000',
    'Rs.4000-Rs.9000',
  ];

  void _nextSlide() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % _imageUrls.length;
    });
  }

  void _prevSlide() {
    setState(() {
      _currentIndex = (_currentIndex - 1) % _imageUrls.length;
    });
  }

  void _selectCategory(int index) {
    // Handle category selection here
    print('Selected category: $index');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: 270,
          child: PageView.builder(
            itemCount: _imageUrls.length,
            controller: PageController(viewportFraction: 0.8),
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  switch (index) {
    case 0:
      Navigator.push(
        context as BuildContext,
        MaterialPageRoute(builder: (context) => trousersScreen()),
      );
      break;
    case 1:
      Navigator.push(
        context as BuildContext,
        MaterialPageRoute(builder: (context) => tshirtscreen()),
      );
      break;
    // case 2:
    //   Navigator.push(
    //     context as BuildContext,
    //     MaterialPageRoute(builder: (context) => kidscreen()),
    //   );
    //   break;
    // case 3:
    //   Navigator.push(
    //     context as BuildContext,
    //     MaterialPageRoute(builder: (context) => accescreen()),
    //   );
    //   break;
    // default:
    //   print('Invalid category index');
  }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          height: 200,
                          width: double.infinity,
                          _imageUrls[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(
                        _categoryNames[index],
                        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.white,),
                      ),
                      Text(
                        _categoryprices[index],
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white,),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}