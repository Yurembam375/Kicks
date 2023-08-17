import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sneaker_app/Router/router.gr.dart';
import 'package:sneaker_app/Utility/logger.dart';
import 'package:sneaker_app/widgets/productCard.dart';

class ShoeWidget extends StatelessWidget {
  const ShoeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection("kicks").snapshots(),
      builder: (context,
          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        if (snapshot.data == null) {
          return const CircularProgressIndicator.adaptive();
        } else {
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
                mainAxisSpacing: 3, crossAxisSpacing: 3, crossAxisCount: 2),
            itemCount: d[0]['shoes'].length,
            itemBuilder: (context, i) {
              return GestureDetector(
                onTap: () {
                  context.router.push(DetailsRoute(
                      offer: d[0]['shoes'][i]["offer"].toString(),
                      brand: d[0]['shoes'][i]["brand"],
                      discription: d[0]['shoes'][i]["description"],
                      label: d[0]['shoes'][i]["label"],
                      price: d[0]['shoes'][i]["price"].toString(),
                      imageUrl: d[0]['shoes'][i]["img_url"],
                      seller: d[0]['shoes'][i]["seller"],
                      size: d[0]['shoes'][i]["size"],
                      shoe: d[0]["shoes"][i]));
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

                    // Update the document in Firestore
                    await documentReference.update({'shoes': n});
                  },
                  offer: d[0]['shoes'][i]["offer"],
                ),
              );
            },
          );
        }
      },
    );
  }
}
