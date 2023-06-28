import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sneaker_app/Router/router.gr.dart';
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
          style: TextStyle(color: Colors.black, fontSize:15,fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.grey[100],
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          primary: false,
          itemCount: categories.length,
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 3, crossAxisCount: 3,crossAxisSpacing: 2),
          itemBuilder: (context, index) {
            CategoriesModel current = categories[index];
            return GestureDetector(
              onTap: () {
                context.router.push( BrandDetailsRoute(tittle: current.tittle));
              },
              child: Container(
                decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[100],
              border: Border.all(color: Colors.grey.withOpacity(0.5))),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(current.imgUrl),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
