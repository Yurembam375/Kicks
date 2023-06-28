import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sneaker_app/Utility/logger.dart';

class WishListCard extends StatelessWidget {
  final String label;
  final String price;
  final String imgurl;
  final String brand;
  final int index;
  const WishListCard(
      {super.key,
      required this.label,
      required this.price,
      required this.imgurl,
      required this.brand,
      required this.index});

  Future<void> deleteproduct() async {
    // Get a reference to the Firestore document
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection('kicks')
        .doc("QzxblNC94G66oEoPteQ1");

    // Retrieve the document snapshot
    DocumentSnapshot snapshot = await documentReference.get();

    if (snapshot.exists) {
      // Get the 'shoes' array from the snapshot data
      List<dynamic> shoes = snapshot.get('shoes');

      // Find the index of the product in the list based on the productId
      // int index = shoes.indexWhere((shoe) {
      //   return shoe['is_favorite'] == true;
      // });
  
      if (index != -1) {
        // Update the 'is_favorite' field for the specific product
        shoes[index]['is_favorite'] = false;

        // Update the document in Firestore
        await documentReference.update({'shoes': shoes});
      }
    }
  }

  Future<void> movetoBag() async {
    // Get a reference to the Firestore document
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection('kicks')
        .doc("QzxblNC94G66oEoPteQ1");

    // Retrieve the document snapshot
    DocumentSnapshot snapshot = await documentReference.get();

    if (snapshot.exists) {
      // Get the 'shoes' array from the snapshot data
      List<dynamic> shoes = snapshot.get('shoes');

      // Find the index of the product in the list based on the productId
      int index = shoes.indexWhere((shoe) {
        return shoe['is_favorite'] == true;
      });

      if (index != -1) {
        // Update the 'is_favorite' field for the specific product
        //shoes[index]['is_favorite'] = false;
        shoes[index]["add_to_bag"] = true;
        //logger.d(shoes[index]["add_to_bag"] = true);
        // Update the document in Firestore
        await documentReference.update({'shoes': shoes});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return card();
  }

  Container card() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[100],
          border: Border.all(color: Colors.grey.withOpacity(0.5))),
      child: Stack(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () async {
                      await deleteproduct();
                    },
                    icon: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.5),
                        border:
                            Border.all(color: Colors.black.withOpacity(0.10)),
                      ),
                      child: const Icon(
                        Icons.close,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
              CachedNetworkImage(
                imageUrl: imgurl,
                height: 110,
                width: 170,
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      brand,
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 3),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  children: [
                    Text("₹$price",
                        style:
                            const TextStyle(color: Colors.black, fontSize: 11)),
                    Text(
                      " ₹$price",
                      style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 11,
                          decoration: TextDecoration.lineThrough),
                    ),
                    Text(
                      " (20% OFF)",
                      style: TextStyle(
                          color: Colors.redAccent.withOpacity(0.8),
                          fontSize: 10),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(7),
                        bottomRight: Radius.circular(7)),
                    border: Border.all(color: Colors.black)),
                height: 35,
                width: 170,
                child: MaterialButton(
                  animationDuration: const Duration(milliseconds: 3),
                  highlightColor: Colors.grey,
                  splashColor: Colors.grey,
                  onPressed: () async {
                    logger.d(index);
                    await movetoBag().whenComplete(() => deleteproduct());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "MOVE TO BAG",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}