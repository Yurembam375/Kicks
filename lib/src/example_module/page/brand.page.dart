import 'package:flutter/material.dart';
import 'package:sneaker_app/src/example_module/data/app_data.dart';

import '../../../model/categories.dart';

class BrandPage extends StatelessWidget {
  const BrandPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Center(
          child: Text(
            "All Brand",
            style: TextStyle(color: Colors.black, fontSize: 23),
          ),
        ),
        backgroundColor: Colors.grey[100],
        elevation: 0,
      ),
      body: GridView.builder(
        physics: const BouncingScrollPhysics(),
        primary: false,
        itemCount: categories.length,
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 10, crossAxisCount: 3),
        itemBuilder: (context, index) {
          CategoriesModel current = categories[index];
          return Card(
            color: Colors.grey[200],
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(current.imgUrl),
            ),
          );
        },
      ),
    );
  }
}
