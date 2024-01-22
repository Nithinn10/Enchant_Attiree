import 'package:enchant_attire/common_widgets/home_container.dart';
import 'package:enchant_attire/consts/banners.dart';
import 'package:flutter/material.dart';
import 'package:enchant_attire/consts/consts.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Image.asset(
          offllogo,
          width: 100,
          height: 60,
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.favorite,
              color: enchant,
            ),
            onPressed: () {
              // Add onPressed logic for the like icon
            },
          ),
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: enchant,
            ),
            onPressed: () {
              // Add onPressed logic for the cart icon
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        color: Colors.white,
        width: context.screenWidth,
        height: context.screenHeight,
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                child: Container(
                  color: Colors.white,
                  child: TextFormField(
                    style: TextStyle(fontSize: 14),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                      hintText: search,
                      fillColor: Colors.grey.shade300,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: enchant),
                      ),
                      prefixIcon: Icon(Icons.search, color: Colors.black),
                      prefixIconColor: Colors.black,
                      hoverColor: enchant,
                      focusColor: enchant,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              VxSwiper.builder(
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        bannerList[index],
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                },
                height: 180,
                enlargeCenterPage: true,
                autoPlay: true,
              ),
              SizedBox(height: 20),
              // Wrap the row with SingleChildScrollView for horizontal scrolling
              Row(
                mainAxisAlignment: MainAxisAlignment.center, // Align to the center
                children: [
                  _buildCircularImage(icn1, "Womens\nParty Wear", () {
                    // Add onPressed logic for the first circular image
                  }),
                  SizedBox(width:5),
                  _buildCircularImage(icn2, "Mens\nParty Wear", () {
                    // Add onPressed logic for the second circular image
                  }),
                  SizedBox(width: 10),
                  _buildCircularImage(icn3, "Grooms\nAttire", () {
                    // Add onPressed logic for the third circular image
                  }),
                  SizedBox(width: 15),
                  _buildCircularImage(icn4, "Bridal\nWear", () {
                    // Add onPressed logic for the fourth circular image
                  }),
                ],
              ),
              // Align the text to the left
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Category In Focus", style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
              // Add the rest of your content here
              SizedBox(height: 5),
              FocusContainer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCircularImage(String imagePath, String category, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: enchant, width: 2),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(35),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              category,
              textAlign: TextAlign.center, // Center the text
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
