import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sneaker_app/Router/router.gr.dart';
import 'package:sneaker_app/Utility/logger.dart';
import 'package:sneaker_app/widgets/productCard.dart';

class SeeAllwidget extends StatelessWidget {
  const SeeAllwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection("kicks").snapshots(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.hasData) {
            List<Map<String, dynamic>> d = snapshot.data!.docs.map((e) {
              logger.e(e.id);
              logger.e(e.data().toString());
              return e.data();
            }).toList();

            logger.d(['shoes'].runtimeType.toString());
            return GridView.builder(
              physics: const BouncingScrollPhysics(),
              primary: false,
              // itemCount: 6,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 2, crossAxisSpacing: 1, crossAxisCount: 2),
              itemCount: d[0]['shoes'].length,
              itemBuilder: (context, i) {
                return GestureDetector(
                  onTap: () {
                    context.router.push(DetailsRoute(
                      brand: d[0]['shoes'][i]["brand"],
                      discription: d[0]['shoes'][i]["description"],
                      label: d[0]['shoes'][i]["label"],
                      price: d[0]['shoes'][i]["price"].toString(),
                      imageUrl: d[0]['shoes'][i]["img_url"],
                    ));
                  },
                  child: ProductCard(
                    label: d[0]['shoes'][i]["label"],
                    price: d[0]['shoes'][i]["price"].toString(),
                    is_favorite: d[0]['shoes'][i]["is_favorite"],
                    imageUrl: d[0]['shoes'][i]["img_url"],
                    brand: d[0]['shoes'][i]["brand"],
                    onPressed: () async {
                      var shoes = d[0]['shoes'] as List;
                      var n =
                          shoes.map((e) => e as Map<String, dynamic>).toList();

                      int index =
                          i; // Assuming 'i' is the index of the item being pressed

                      if (n[index]["is_favorite"] == true) {
                        n[index]["is_favorite"] = false;
                      } else {
                        n[index]["is_favorite"] = true;
                      }
                      DocumentReference documentReference = FirebaseFirestore
                          .instance
                          .collection('kicks')
                          .doc("QzxblNC94G66oEoPteQ1");

                      // Update the document in
                      await documentReference.update({'shoes': n});
                    },
                  ),
                );
              },
            );
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}
