import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sneaker_app/Router/router.gr.dart';
import 'package:sneaker_app/model/search.dart';
import 'package:sneaker_app/widgets/badgeCartno.dart';
import 'package:sneaker_app/widgets/productCard.dart';

class BrandDetailsPage extends StatelessWidget {
  final String tittle;
  const BrandDetailsPage({super.key, required this.tittle});
  Stream<List<Map<String, dynamic>>> brandShoes() {
    return FirebaseFirestore.instance
        .collection('kicks')
        .snapshots()
        .map((QuerySnapshot snapshot) {
      List<Map<String, dynamic>> brandShoes = [];

      for (var document in snapshot.docs) {
        Map<String, dynamic>? data = document.data() as Map<String, dynamic>?;

        if (data != null &&
            data.containsKey('shoes') &&
            data['shoes'] != null) {
          List<dynamic> shoes = data['shoes'] as List<dynamic>;

          for (var shoe in shoes) {
            if (shoe is Map<String, dynamic> && shoe['brand'] == tittle) {
              brandShoes.add(Map<String, dynamic>.from(shoe));
            }
          }
        }
      }
      return brandShoes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          elevation: 0,
          backgroundColor: Colors.grey[100],
          title: Text(
            tittle,
            style: const TextStyle(
                color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 1),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      showSearch(
                          context: context, delegate: MySearchDelegate());
                    },
                    icon: const Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      context.router.push(const WishlistRoute());
                    },
                    icon: const Icon(
                      Icons.favorite_border,
                      color: Colors.black,
                    ),
                  ),
                  const BadgeCartno()
                ],
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: StreamBuilder<List<Map<String, dynamic>>>(
            stream: brandShoes(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                // ignore: non_constant_identifier_names
                List<Map<String, dynamic>> brandShoes = snapshot.data!;
                return GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  primary: false,
                  // itemCount: 6,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 2,
                      crossAxisSpacing: 2,
                      crossAxisCount: 2),
                  itemCount: brandShoes.length,
                  itemBuilder: (context, i) {
                    Map<String, dynamic> shoe = brandShoes[i];
                    return GestureDetector(
                        onTap: () {
                          context.router.push(DetailsRoute(
                              offer: shoe["offer"].toString(),
                              label: shoe["label"],
                              price: shoe["price"],
                              imageUrl: shoe["img_url"],
                              brand: shoe["brand"],
                              discription: shoe["description"],
                              seller: shoe["seller"],
                              size: shoe["size"],
                              shoe: shoe));
                        },
                        child: ProductCard(
                          label: shoe["label"],
                          price: shoe["price"],
                          is_favorite: shoe["is_favorite"],
                          imageUrl: shoe["img_url"],
                          brand: shoe["brand"],
                          onPressed: () async {
                            //log(shoe.toString());
                            DocumentReference documentReference =
                                FirebaseFirestore.instance
                                    .collection('kicks')
                                    .doc("QzxblNC94G66oEoPteQ1");

                            // Retrieve the document snapshot
                            DocumentSnapshot snapshot =
                                await documentReference.get();

                            if (snapshot.exists) {
                              // Get the 'shoes' array from the snapshot data
                              List<dynamic> shoes = snapshot.get('shoes');
                              for (var element in shoes) {
                                if (element["product_Id"] ==
                                    shoe["product_Id"]) {
                                  //log(shoes.toString());
                                  int productindex = shoes.indexOf(element);
                                  if (shoes[productindex]["is_favorite"] ==
                                      true) {
                                    shoes[productindex]["is_favorite"] = false;
                                  } else {
                                    shoes[productindex]["is_favorite"] = true;
                                  }
                                  await documentReference
                                      .update({'shoes': shoes});
                                }
                              }
                            }
                          },
                          offer: shoe["offer"],
                        ));
                  },
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ));
  }
}
