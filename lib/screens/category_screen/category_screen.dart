import 'package:enchant_attire/consts/images.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Category Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildCategoryContainer(
                  icn3,
                  'assets/category1.jpg',
                  () => _onCategoryTap(context, 'Category 1'),
                ),
                _buildCategoryContainer(
                  'Category 2',
                  icn4,
                  () => _onCategoryTap(context, 'Category 2'),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildCategoryContainer(
                  'Category 3',
                  icn1,
                  () => _onCategoryTap(context, 'Category 3'),
                ),
                _buildCategoryContainer(
                  'Category 4',
                  icn2,
                  () => _onCategoryTap(context, 'Category 4'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryContainer(
    String categoryName,
    String imagePath,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 8),
            Text(
              categoryName,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  void _onCategoryTap(BuildContext context, String category) {
    // Add your logic when a category is tapped
    print('Category tapped: $category');
    // Example: Navigate to a new screen
    // Navigator.push(context, MaterialPageRoute(builder: (_) => DetailsScreen(category)));
  }
}
