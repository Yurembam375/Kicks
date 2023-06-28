import 'package:flutter/material.dart';
import 'package:sneaker_app/widgets/bagWidget.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool isChecked = false;
  List<Map<String, dynamic>> bagshoes = [];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Visibility(
            visible: false,
            child: Column(
              children: const [
                Center(
                  child: Text(
                    "Shopping Bag",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                // Text()
              ],
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite_border,
                  color: Colors.black,
                ))
          ],
          backgroundColor: Colors.grey[100],
          elevation: 0,
        ),
        body: const BagWidget(),
        // body: SingleChildScrollView(
        //   child: Column(
        //     children: [
        //       Container(
        //         padding:
        //             const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        //         height: 50,
        //         color: Colors.white,
        //         child: Column(
        //           children: [
        //             Row(
        //               mainAxisAlignment: MainAxisAlignment.start,
        //               children: const [
        //                 Text(
        //                   "Deliver to:",
        //                   style: TextStyle(
        //                     color: Colors.black54,
        //                   ),
        //                 ),
        //                 SizedBox(
        //                   width: 3,
        //                 ),
        //                 Text(
        //                   "Tom Yurembam",
        //                   style: TextStyle(
        //                       color: Colors.black,
        //                       fontWeight: FontWeight.bold,
        //                       fontSize: 15),
        //                 ),
        //                 Text(
        //                   ",795001",
        //                   style: TextStyle(
        //                       color: Colors.black,
        //                       fontWeight: FontWeight.bold,
        //                       fontSize: 15),
        //                 ),
        //                 SizedBox(
        //                   width: 60,
        //                 ),
        //                 Text(
        //                   "Change",
        //                   style: TextStyle(
        //                       color: Colors.redAccent,
        //                       fontWeight: FontWeight.bold,
        //                       fontSize: 15),
        //                 ),
        //               ],
        //             ),
        //             const SizedBox(
        //               height: 4,
        //             ),
        //             Row(
        //               mainAxisAlignment: MainAxisAlignment.start,
        //               children: const [
        //                 Text(
        //                   "Singjamei Chongtham leikai,Imphal west ",
        //                   style: TextStyle(color: Colors.black54),
        //                 ),
        //               ],
        //             )
        //           ],
        //         ),
        //       ),
        //       const SizedBox(
        //         height: 10,
        //       ),
        //       Container(
        //         padding:
        //             const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        //         color: Colors.white,
        //         height: 150,
        //         width: double.infinity,
        //         child: Column(
        //           children: [
        //             Row(
        //               children: [
        //                 Image.asset(
        //                   "assets/image/offer1.png",
        //                   height: 20,
        //                 ),
        //                 const Text(
        //                   " Offers",
        //                   style: TextStyle(
        //                       fontWeight: FontWeight.bold, fontSize: 15),
        //                 ),
        //               ],
        //             ),
        //             const SizedBox(
        //               height: 10,
        //             ),
        //             Container(
        //               padding: const EdgeInsets.symmetric(
        //                   horizontal: 10, vertical: 5),
        //               height: 80,
        //               width: 300,
        //               decoration: BoxDecoration(
        //                   color: Colors.white,
        //                   border:
        //                       Border.all(color: Colors.grey.withOpacity(0.5))),
        //               child: Column(
        //                 children: [
        //                   Row(
        //                     mainAxisAlignment: MainAxisAlignment.start,
        //                     children: const [
        //                       Text(
        //                         "Up to 500 Cashback",
        //                         style: TextStyle(
        //                             fontWeight: FontWeight.bold, fontSize: 15),
        //                       ),
        //                     ],
        //                   ),
        //                   const Text(
        //                     "Cashback on CRED pay UPI transaction on a min spend of 1,000 .T&C",
        //                     style: TextStyle(color: Colors.black54),
        //                   )
        //                 ],
        //               ),
        //             )
        //           ],
        //         ),
        //       ),
        //       Row(
        //         mainAxisAlignment: MainAxisAlignment.start,
        //         children: [
        //           Checkbox(
        //             activeColor: Colors.black,
        //             value: isChecked,
        //             onChanged: (value) {
        //               setState(() {
        //                 isChecked = !isChecked;
        //               });
        //             },
        //           ),
        //           const Text(
        //             "1/1 ITEM IS SELECTED",
        //             style: TextStyle(
        //                 color: Colors.black,
        //                 fontWeight: FontWeight.bold,
        //                 fontSize: 15),
        //           ),
        //           const SizedBox(
        //             width: 3,
        //           ),
        //           const Text(
        //             "(₹599)",
        //             style: TextStyle(
        //                 color: Colors.redAccent,
        //                 fontWeight: FontWeight.bold,
        //                 fontSize: 15),
        //           ),
        //           const SizedBox(
        //             width: 40,
        //           ),
        //           const Icon(Icons.share),
        //           const SizedBox(
        //             width: 10,
        //           ),
        //           const Icon(Icons.delete),
        //           // const Icon(Icons.favorite_border)
        //         ],
        //       ),

        //       const SizedBox(
        //         height: 10,
        //       ),
        //       Container(
        //         padding:
        //             const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        //         height: 165,
        //         color: Colors.white,
        //         width: double.infinity,
        //         child: Column(
        //           children: [
        //             Row(
        //               mainAxisAlignment: MainAxisAlignment.start,
        //               children: const [
        //                 Text(
        //                   "PRICE DETAILS",
        //                   style: TextStyle(
        //                       color: Colors.redAccent,
        //                       fontWeight: FontWeight.bold),
        //                 ),
        //                 Text(
        //                   "(1 Items)",
        //                   style: TextStyle(
        //                       color: Colors.redAccent,
        //                       fontWeight: FontWeight.bold),
        //                 ),
        //               ],
        //             ),
        //             const Divider(),
        //             Row(
        //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //               children: const [
        //                 Text(
        //                   "TotalMRP",
        //                   style: TextStyle(
        //                     color: Colors.black54,
        //                   ),
        //                 ),
        //                 Text("₹ 2,500")
        //               ],
        //             ),
        //             const SizedBox(
        //               height: 5,
        //             ),
        //             Row(
        //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //               children: const [
        //                 Text(
        //                   "Discount on MRP",
        //                   style: TextStyle(
        //                     color: Colors.black54,
        //                   ),
        //                 ),
        //                 Text(
        //                   "-₹500",
        //                   style: TextStyle(color: Colors.blue),
        //                 )
        //               ],
        //             ),
        //             const SizedBox(
        //               height: 5,
        //             ),
        //             Row(
        //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //               children: const [
        //                 Text(
        //                   "Coupon Discount",
        //                   style: TextStyle(
        //                     color: Colors.black54,
        //                   ),
        //                 ),
        //                 Text(
        //                   "Apply Coupon",
        //                   style: TextStyle(color: Colors.redAccent),
        //                 )
        //               ],
        //             ),
        //             const SizedBox(
        //               height: 5,
        //             ),
        //             Row(
        //               mainAxisAlignment: MainAxisAlignment.start,
        //               children: const [
        //                 Text(
        //                   "Convenience Free ",
        //                   style: TextStyle(
        //                     color: Colors.black54,
        //                   ),
        //                 ),
        //                 SizedBox(
        //                   width: 5,
        //                 ),
        //                 Text(
        //                   "Know More ",
        //                   style: TextStyle(
        //                       color: Colors.redAccent,
        //                       fontWeight: FontWeight.bold),
        //                 ),
        //                 SizedBox(
        //                   width: 110,
        //                 ),
        //                 Text(
        //                   "FREE",
        //                   style: TextStyle(color: Colors.blue),
        //                 )
        //               ],
        //             ),
        //             const Divider(),
        //             Row(
        //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //               children: const [
        //                 Text(
        //                   "Total Amount",
        //                   style: TextStyle(
        //                       color: Colors.redAccent,
        //                       fontWeight: FontWeight.bold),
        //                 ),
        //                 Text(
        //                   "₹2,000",
        //                   style: TextStyle(fontWeight: FontWeight.bold),
        //                 )
        //               ],
        //             ),
        //           ],
        //         ),
        //       ),
        //       // SizedBox(
        //       //   height: 50,
        //       //   width: 350,
        //       //   child: ElevatedButton(
        //       //     onPressed: () async {},
        //       //     style: const ButtonStyle(
        //       //         backgroundColor: MaterialStatePropertyAll(Colors.redAccent)),
        //       //     child: const Text(
        //       //       "PLACE ORDER",
        //       //       style: TextStyle(fontWeight: FontWeight.bold),
        //       //     ),
        //       //   ),
        //       // ),
        //     ],
        //   ),
       // )
        );
  }
}
