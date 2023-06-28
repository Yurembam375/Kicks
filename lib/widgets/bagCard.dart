import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BagCard extends StatefulWidget {
  final String label;
  final String imgurl;
  final String brand;
  final String price;

  const BagCard(
      {super.key,
      required this.label,
      required this.imgurl,
      required this.brand,
      required this.price});

  @override
  State<BagCard> createState() => _BagCardState();
}

class _BagCardState extends State<BagCard> {
  bool isChecked = false;
  String selectedsize = '6';
  String selectedQty = '1';

  List<String> size = [
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    "12",
  ];

  List<String> qty = ['1', '2', '3', '4', '5', '6', "7", "8", "9"];

  Future<void> deleteproductfrombag() async {
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
        return shoe['add_to_bag'] == true;
      });

      if (index != -1) {
        // Update the 'is_favorite' field for the specific product
        shoes[index]['add_to_bag'] = false;

        // Update the document in Firestore
        await documentReference.update({'shoes': shoes});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              border: Border.all(color: Colors.grey.withOpacity(0.5))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 4,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 9),
                  height: 150,
                  color: Colors.white,
                  child: Column(
                    children: [
                      Container(
                          height: 130,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(7),
                              border: Border.all(
                                  color: Colors.grey.withOpacity(0.5))),
                          child: CachedNetworkImage(
                            imageUrl: widget.imgurl,
                          ))
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 8,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
                  height: 150,
                  color: Colors.white,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.brand,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            InkWell(
                                onTap: () async {
                                  await deleteproductfrombag();
                                },
                                child: const Icon(Icons.close)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              widget.brand,
                              style: const TextStyle(
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              "Sold by:S&S Marketing",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3),
                        child: Row(
                          children: const [
                            Icon(Icons.visibility, size: 15),
                            Text(
                              "150",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "  People viewing now",
                              style: TextStyle(
                                  fontSize: 14, color: Colors.black54),
                            )
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            height: 35,
                            width: 220,
                            color: Colors.orangeAccent.withOpacity(0.1),
                            child: Row(
                              children: [
                                const Text(
                                  "Size:",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  width: 3,
                                ),
                                DropdownButton(
                                  alignment: Alignment.centerLeft,
                                  menuMaxHeight: 300,
                                  underline: Container(
                                    color: Colors.transparent,
                                  ),
                                  elevation: 0,
                                  icon: const Icon(
                                    Icons.arrow_drop_down,
                                    size: 20,
                                    color: Colors.black,
                                  ),
                                  items: size.map((String items) {
                                    return DropdownMenuItem<String>(
                                        value: items,
                                        child: Text(
                                          items,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ));
                                  }).toList(),
                                  value: selectedsize,
                                  onChanged: (String? newvalue) {
                                    setState(() {
                                      selectedsize = newvalue!;
                                    });
                                  },
                                ),
                                const Text(
                                  "Qty:",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  width: 3,
                                ),
                                DropdownButton(
                                  alignment: Alignment.centerLeft,
                                  menuMaxHeight: 300,
                                  underline: Container(
                                    color: Colors.transparent,
                                  ),
                                  elevation: 0,
                                  icon: const Icon(
                                    Icons.arrow_drop_down,
                                    size: 20,
                                    color: Colors.black,
                                  ),
                                  items: qty.map((String items) {
                                    return DropdownMenuItem<String>(
                                        value: items,
                                        child: Text(
                                          items,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ));
                                  }).toList(),
                                  value: selectedQty,
                                  onChanged: (String? newvalue) {
                                    setState(() {
                                      selectedQty = newvalue!;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3),
                        child: Row(
                          children: [
                            Text(
                              widget.price,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              widget.price,
                              style: const TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  color: Colors.black54),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            const Text(
                              "₹500 OFF",
                              style: TextStyle(
                                  color: Colors.redAccent,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 1,
          left: 1,
          child: Checkbox(
            activeColor: Colors.black,
            value: isChecked,
            onChanged: (value) {
              setState(() {
                isChecked = !isChecked;
              });
            },
          ),
        )
      ],
    );
  }
}
