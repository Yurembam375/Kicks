import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class WishlistnoItem extends StatelessWidget {
  const WishlistnoItem({super.key});
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
            return Container();
          } else {
            return Text(
              "${favoriteShoes.length.toString()} Items",
              style: const TextStyle(
                color: Colors.black54,
                fontSize: 12.5,
              ),
              maxLines: 1,
            );
          }

          //  },
          //   );

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
