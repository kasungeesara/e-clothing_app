// ignore_for_file: file_names, unused_import
import 'package:e_clothing/screens/user_panel/mens.dart';
import 'package:flutter/material.dart';

import '../screens/user_panel/accessories.dart';
import '../screens/user_panel/kids.dart';
import '../screens/user_panel/womens.dart';



class MiniCategoryCarousel extends StatefulWidget {
  const MiniCategoryCarousel({super.key});

  @override
  _MiniCategoryCarouselState createState() => _MiniCategoryCarouselState();
}

class _MiniCategoryCarouselState extends State<MiniCategoryCarousel> {
  int _currentIndex = 0;
  final List<String> _imageUrls = [
    'assets/mens.jpg',
    'assets/women.jpg',
    'assets/kids.jpg',
    'assets/items.jpg',
  ];
  final List<String> _categoryNames = [
    'Men',
    'Women',
    'Kids',
    'Accessories',
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
          height: 240,
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
        MaterialPageRoute(builder: (context) => MenClothingScreen()),
      );
      break;
    case 1:
      Navigator.push(
        context as BuildContext,
        MaterialPageRoute(builder: (context) => womenscreen()),
      );
      break;
    case 2:
      Navigator.push(
        context as BuildContext,
        MaterialPageRoute(builder: (context) => kidscreen()),
      );
      break;
    case 3:
      Navigator.push(
        context as BuildContext,
        MaterialPageRoute(builder: (context) => accescreen()),
      );
      break;
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
                        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.white),
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

