import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  final List<Map<String, String>> categories = [
    {'name': 'Arts & Photography', 'image': 'assets/images/art.jpg'},
    {'name': 'Biographies', 'image': 'assets/images/biography.jpg'},
    {'name': 'Business & Money', 'image': 'assets/images/business.jpg'},
    {'name': 'Comics', 'image': 'assets/images/comics.jpg'},
    {'name': 'Education', 'image': 'assets/images/education.jpg'},
    {'name': 'Fantasy', 'image': 'assets/images/fantasy.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Categories"),
        backgroundColor: const Color.fromARGB(255, 237, 149, 178),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          itemCount: categories.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            final category = categories[index];
            return GestureDetector(
              onTap: () {
                // TODO: Navigate to category books
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: AssetImage(category['image']!),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.3),
                      BlendMode.darken,
                    ),
                  ),
                ),
                child: Center(
                  child: Text(
                    category['name']!,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      shadows: [Shadow(blurRadius: 3, color: Colors.black)],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
