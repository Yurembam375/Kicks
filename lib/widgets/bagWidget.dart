import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sneaker_app/widgets/bagCard.dart';

class BagWidget extends StatelessWidget {
  const BagWidget({
    super.key,
  });

  Stream<List<Map<String, dynamic>>> streamAddtoBadShoes() {
    return FirebaseFirestore.instance
        .collection('kicks')
        .snapshots()
        .map((QuerySnapshot snapshot) {
      List<Map<String, dynamic>> bagshoes = [];

      for (var document in snapshot.docs) {
        Map<String, dynamic>? data = document.data() as Map<String, dynamic>?;

        if (data != null &&
            data.containsKey('shoes') &&
            data['shoes'] != null) {
          List<dynamic> shoes = data['shoes'] as List<dynamic>;

          for (var shoe in shoes) {
            if (shoe is Map<String, dynamic> && shoe['add_to_bag'] == true) {
              bagshoes.add(Map<String, dynamic>.from(shoe));
            }
          }
        }
      }
      return bagshoes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: streamAddtoBadShoes(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Map<String, dynamic>> bagshoes = snapshot.data!;
          if (bagshoes.isEmpty) {
            return Center(
              child: Container(
                color: Colors.grey[100],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/image/emptywish.png",
                      color: Colors.black,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Your Wishlist is empty",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("Explor more and shortlist some items",
                        style: TextStyle(fontSize: 15, color: Colors.grey))
                  ],
                ),
              ),
            );
          } else {
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              primary: false,
              shrinkWrap: true,
              itemCount: bagshoes.length,
              itemBuilder: (context, i) {
                Map<String, dynamic> shoe = bagshoes[i];
                // Build your UI for each shoe item
                return BagCard(
                  label: shoe["label"],
                  imgurl: shoe["img_url"],
                  brand: shoe["brand"],
                  price: shoe["price"].toString(),
                  shoe: shoe, seller: shoe["seller"],
                  qty: shoe["qty"],
                  size: shoe["size"],
                );
              },
            );
          }
          // Build your UI using the favoriteShoes list
        } else if (snapshot.hasError) {
          // Handle error
          return Text('Error: ${snapshot.error}');
        } else {
          // Show loading indicator
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
