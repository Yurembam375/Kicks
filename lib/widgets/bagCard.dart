import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BagCard extends StatefulWidget {
  final String label;
  final String imgurl;
  final String brand;
  final String price;
  final Map<String, dynamic> shoe;
  final String seller;
  final List<dynamic> size;
  final List<dynamic> qty;
  final String offer;
  final bool isretunable;
  String selectedSize;
  String selectQTy;

  BagCard(
      {super.key,
      required this.label,
      required this.imgurl,
      required this.brand,
      required this.price,
      required this.shoe,
      required this.seller,
      required this.size,
      required this.qty,
      required this.offer,
      required this.isretunable,
      required this.selectQTy,
      required this.selectedSize});

  @override
  State<BagCard> createState() => _BagCardState();
}

class _BagCardState extends State<BagCard> {
  bool isChecked = false;

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
      //  Find the index of the product in the list based on the productId
      for (var element in shoes) {
        if (element["product_Id"] == widget.shoe["product_Id"]) {
          int productIndex = shoes.indexOf(element);
          shoes[productIndex]["add_to_bag"] = false;
          await documentReference.update({"shoes": shoes});
        }
      }
    }
  }

  Future<void> updateSelectedSize() async {
    // Get a reference to the Firestore document
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection('kicks')
        .doc("QzxblNC94G66oEoPteQ1");
    // Retrieve the document snapshot
    DocumentSnapshot snapshot = await documentReference.get();

    if (snapshot.exists) {
      // Get the 'shoes' array from the snapshot data
      List<dynamic> shoes = snapshot.get('shoes');
      //  Find the index of the product in the list based on the productId
      for (var element in shoes) {
        if (element["product_Id"] == widget.shoe["product_Id"]) {
          int productIndex = shoes.indexOf(element);
          shoes[productIndex]["selectedSize"] = widget.selectedSize;
          await documentReference.update({"shoes": shoes});
        }
      }
    }
  }

  Future<void> updateSelectedQty() async {
    // Get a reference to the Firestore document
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection('kicks')
        .doc("QzxblNC94G66oEoPteQ1");
    // Retrieve the document snapshot
    DocumentSnapshot snapshot = await documentReference.get();

    if (snapshot.exists) {
      // Get the 'shoes' array from the snapshot data
      List<dynamic> shoes = snapshot.get('shoes');
      //  Find the index of the product in the list based on the productId
      for (var element in shoes) {
        if (element["product_Id"] == widget.shoe["product_Id"]) {
          int productIndex = shoes.indexOf(element);
          shoes[productIndex]["selectesQty"] = widget.selectQTy;
          await documentReference.update({"shoes": shoes});
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    double offer = double.parse(widget.price.toString()) *
        double.parse(widget.selectQTy.toString()) *
        double.parse(widget.offer.toString()) /
        double.parse(100.toString());
    double newPrice = double.parse(widget.price.toString()) *
            double.parse(widget.selectQTy.toString()) -
        double.parse(offer.toString());
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 4),
      child: Stack(
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
                //borderRadius: BorderRadius.circular(7),
                border: Border.all(color: Colors.grey)),
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
                                border: Border.all(color: Colors.grey)),
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
                                  splashColor: Colors.black,
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
                                widget.label,
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
                            children: [
                              Text(
                                "Sold by:${widget.seller}",
                                style: const TextStyle(
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
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  showModalBottomSheet(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                    context: context,
                                    builder: (context) {
                                      int tabIndex = widget.size
                                          .indexOf(widget.selectedSize);

                                      return StatefulBuilder(
                                        builder: (context, setState) {
                                          return SizedBox(
                                            height: 140,
                                            width: screenSize.width,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 15, top: 10),
                                                  child: Text(
                                                    'Select size',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 75,
                                                  // color: Colors.green,
                                                  width: screenSize.width,
                                                  child: ListView.builder(
                                                    itemCount:
                                                        widget.size.length,
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    shrinkWrap: true,
                                                    padding: const EdgeInsets
                                                        .fromLTRB(10, 3, 15, 7),
                                                    itemBuilder:
                                                        (context, index) {
                                                      return Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(left: 5),
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            setState(() {
                                                              widget.selectedSize =
                                                                  widget.size[
                                                                      index];
                                                              tabIndex = index;
                                                              log(widget
                                                                  .selectedSize
                                                                  .toString());
                                                              context.router
                                                                  .pop();
                                                            });
                                                          },
                                                          child: Container(
                                                            height: 50,
                                                            width: 50,
                                                            decoration: BoxDecoration(
                                                                color: index ==
                                                                        tabIndex
                                                                    ? Colors
                                                                        .black
                                                                    : Colors
                                                                        .transparent,
                                                                border: Border.all(
                                                                    color: Colors
                                                                        .black),
                                                                shape: BoxShape
                                                                    .circle),
                                                            child: Center(
                                                                child: Text(
                                                              widget
                                                                  .size[index],
                                                              style: TextStyle(
                                                                color: index ==
                                                                        tabIndex
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black,
                                                              ),
                                                            )),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () async {
                                                    Navigator.pop(context);
                                                    await updateSelectedSize();
                                                  },
                                                  child: Container(
                                                    height: 37,
                                                    width: screenSize.width,
                                                    color:
                                                        const Color(0xfff4456e),
                                                    child: const Center(
                                                        child: Text(
                                                      'Done',
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    )),
                                                  ),
                                                )
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  );
                                },

                                // Size Small Grey Container

                                child: Container(
                                  padding: EdgeInsets.zero,
                                  height: 25,
                                  decoration: BoxDecoration(
                                    color: const Color(0xfff4f4f4),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text('Size:${widget.selectedSize}'),
                                        const Icon(
                                            Icons.arrow_drop_down_outlined)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 15),

                            //  Quantity of items

                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  showModalBottomSheet(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                    context: context,
                                    builder: (context) {
                                      int tabIndex =
                                          widget.qty.indexOf(widget.selectQTy);
                                      log(tabIndex.toString());

                                      return StatefulBuilder(
                                        builder: (context, setState) {
                                          return SizedBox(
                                            height: 140,
                                            width: screenSize.width,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 15, top: 10),
                                                  child: Text(
                                                    'Select Quantity',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 75,
                                                  // color: Colors.green,
                                                  width: screenSize.width,
                                                  child: ListView.builder(
                                                    itemCount:
                                                        widget.qty.length,
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    shrinkWrap: true,
                                                    padding: const EdgeInsets
                                                        .fromLTRB(10, 3, 15, 7),
                                                    itemBuilder:
                                                        (context, index) {
                                                      log(widget.qty.length
                                                          .toString());
                                                      return Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(left: 5),
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            setState(() {
                                                              widget.selectQTy =
                                                                  widget.qty[
                                                                      index];
                                                              tabIndex = index;
                                                              log(widget
                                                                  .selectQTy
                                                                  .toString());
                                                              context.router
                                                                  .pop();
                                                            });
                                                          },
                                                          child: Container(
                                                            height: 50,
                                                            width: 50,
                                                            decoration: BoxDecoration(
                                                                color: index ==
                                                                        tabIndex
                                                                    ? Colors
                                                                        .black
                                                                    : Colors
                                                                        .transparent,
                                                                border: Border.all(
                                                                    color: Colors
                                                                        .black),
                                                                shape: BoxShape
                                                                    .circle),
                                                            child: Center(
                                                                child: Text(
                                                              widget.qty[index]
                                                                  .toString(),
                                                              style: TextStyle(
                                                                color: index ==
                                                                        tabIndex
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black,
                                                              ),
                                                            )),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () async {
                                                    Navigator.pop(context);
                                                    await updateSelectedQty();
                                                  },
                                                  child: Container(
                                                    height: 37,
                                                    width: screenSize.width,
                                                    color:
                                                        const Color(0xfff4456e),
                                                    child: const Center(
                                                        child: Text(
                                                      'Done',
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    )),
                                                  ),
                                                )
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  );
                                },

                                // Size Small Grey Container

                                child: Container(
                                  padding: EdgeInsets.zero,
                                  height: 25,
                                  decoration: BoxDecoration(
                                    color: const Color(0xfff4f4f4),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text('Qty:${widget.selectQTy}'),
                                        const Icon(
                                            Icons.arrow_drop_down_outlined)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 3),
                          child: Row(
                            children: [
                              Text(
                                "₹$newPrice",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              Visibility(
                                visible: widget.offer == "0" ? false : true,
                                child: Text(
                                  "₹${widget.price}",
                                  style: const TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      color: Colors.black54),
                                ),
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              Visibility(
                                visible: widget.offer == "0" ? false : true,
                                child: Text(
                                  "${widget.offer}%OFF",
                                  style: const TextStyle(
                                      color: Colors.redAccent,
                                      fontWeight: FontWeight.bold),
                                ),
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
            left: 4,
            child: Transform.scale(
              scale: 0.8,
              child: Checkbox(
                materialTapTargetSize: MaterialTapTargetSize.padded,
                shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(1)),
                side: const BorderSide(width: 0.8),
                value: isChecked,
                onChanged: (value) {
                  setState(() {
                    isChecked = !isChecked;
                  });
                },
                overlayColor: const MaterialStatePropertyAll(Colors.white),
                activeColor: Colors.black,
                //activeColor: const Color(0xfff4456e),
                checkColor: Colors.white,
                tristate: false,
              ),
            ),
          )
        ],
      ),
    );
  }
}
