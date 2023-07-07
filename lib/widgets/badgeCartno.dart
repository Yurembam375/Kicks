import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class BadgeCartno extends StatelessWidget {
  const BadgeCartno({super.key});
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
          return badges.Badge(
            position: badges.BadgePosition.topEnd(top: 3, end: 7),
            badgeStyle: badges.BadgeStyle(
                badgeColor:bagshoes.isEmpty ? Colors.transparent : Colors.red,
                elevation: 0,
                padding: const EdgeInsets.all(5),
                borderRadius: BorderRadius.circular(4)),
            badgeContent: Text(
              bagshoes.length.toString(),
              style: TextStyle(
                  color: bagshoes.isEmpty ? Colors.transparent : Colors.white,
                  fontSize: 12),
            ),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  CupertinoIcons.bag,
                  color: Colors.black,
                )),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
