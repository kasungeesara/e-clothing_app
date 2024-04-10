// ignore_for_file: file_names, unused_import, prefer_const_constructors, depend_on_referenced_packages

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../utils/appconst.dart';
import '../../widget/categorycarousel.dart';
import '../../widget/custom-drawer.dart';
import '../../widget/flash-sale.dart';
import '../../widget/heading-widget.dart';
import 'allcategory.dart';

class mainscreen extends StatelessWidget {
  const mainscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppConstant.appsecondarycolor,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          title: Center(
            child: Text(
              AppConstant.appMainName,
              style: TextStyle(
                color: AppConstant.apptextcolor,
                fontSize: 25,
              ),
            ),
          ),
          backgroundColor: AppConstant.appmaincolor,
        ),
        
        // _SearchScreenState createState() => SearchBar();
        drawer: Sidebar(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/main.jpg',
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
              ),
              heading(
                headingTitle: 'Categories',
                headingSubTitle: 'According to your budget',
                onTap:() {
                  Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => allcategoryscreen())
                    );
                },
                buttonText: 'see more',
              ),
              MiniCategoryCarousel(),
              Padding(
                padding: const EdgeInsets.only(left: 15,bottom: 10),
                child: Text('Flash Sale',
                textAlign:TextAlign.end,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                ),
                
                
                ),
              ),
              
              // heading(
              //   headingTitle: 'Flash Sale',
              //   headingSubTitle: '',
              //   onTap:() {},
              //   buttonText: 'see more',
              // ),
              CategoryCarousel(),
              // Text('hutto')
            ],
          ),
        ),
      ),
    );
  }
}
