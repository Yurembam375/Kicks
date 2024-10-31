
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lottie/lottie.dart';
import 'package:sneaker_app/Router/router.gr.dart';

class OrderSucssfull extends StatelessWidget {
  const OrderSucssfull({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("order").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<QueryDocumentSnapshot> documents = snapshot.data!.docs;

            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Lottie.asset(
                  'assets/lotti/sucessful.json',height: 200
                ),
                const Text(
                  "Order Placed , Thank You ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "Shipping to :",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 19,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                    itemCount: documents.length,
                    itemBuilder: (context, index) {
                      Map<String, dynamic> orderData =
                          documents[index].data() as Map<String, dynamic>;

                      String name = orderData['name'];
                      String address = orderData['address'];
                      String pincode = orderData['pincode'];
                      String mobileno = orderData['mobileno'];
                      // You can extract other fields similarly

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Name: $name'),
                          Text('Address: $address'),
                          Text('Pincode: $pincode'),
                          Text('Mobile no: $mobileno')
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                      side: MaterialStateProperty.all(BorderSide.none),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      )),
                    ),
                    onPressed: () {
                      context.router.push(
                          const AuthFlowpage()); // Navigate to another page or perform some action
                    },
                    child: const Text(
                      'Continue Shopping',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
