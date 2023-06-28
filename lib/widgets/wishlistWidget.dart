import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sneaker_app/widgets/wishlistCard.dart';

class WishlistWidget extends StatelessWidget {
  const WishlistWidget({super.key});

  Stream<List<Map<String, dynamic>>> streamFavoriteShoes() {
    return FirebaseFirestore.instance
        .collection('kicks')
        .snapshots()
        .map((QuerySnapshot snapshot) {
      List<Map<String, dynamic>> favoriteShoes = [];

      for (var document in snapshot.docs) {
        Map<String, dynamic>? data = document.data() as Map<String, dynamic>?;

        if (data != null &&
            data.containsKey('shoes') &&
            data['shoes'] != null) {
          List<dynamic> shoes = data['shoes'] as List<dynamic>;

          for (var shoe in shoes) {
            if (shoe is Map<String, dynamic> && shoe['is_favorite'] == true) {
              favoriteShoes.add(Map<String, dynamic>.from(shoe));
            }
          }
        }
      }
      return favoriteShoes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Map<String, dynamic>>>(
      stream: streamFavoriteShoes(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Map<String, dynamic>> favoriteShoes = snapshot.data!;
          if (favoriteShoes.isEmpty) {
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
            return GridView.builder(
              physics: const BouncingScrollPhysics(),
              primary: false,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 3,
                  mainAxisSpacing: 3,
                  childAspectRatio: 2 / 3),
              itemCount: favoriteShoes.length,
              itemBuilder: (context, i) {
                Map<String, dynamic> shoe = favoriteShoes[i];
                // Build your UI for each shoe item
                return WishListCard(
                  label: shoe["label"],
                  price: shoe["price"].toString(),
                  imgurl: shoe["img_url"],
                  brand: shoe["brand"],
                  index: favoriteShoes.indexOf(shoe),
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
