import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  // final CollectionReference product =
  //     FirebaseFirestore.instance.collection('kicks');

  final CollectionReference users =
      FirebaseFirestore.instance.collection('kicks');
  Future<void> addProduct() {
    return users
        .add({
          "shoes": [
            {
              "product": "1",
              "label": "Air Jordan",
              "price": 340,
              "img_url": "https://firebasestorage.googleapis.com/v0/b/sneaker-app-a434e.appspot.com/o/jordans4.png?alt=media&token=d4c3f0ab-cdf9-4595-a228-3eef6f1080cf",
              "description":
                  "Follow in the footsteps of greatness. The all-time classic AJ1 design gets a makeover with fresh pops of colour and mixed materials"
            },
            {
              "product_Id": "2",
              "label": "Air Jordan",
              "price": 113,
              "rating": 4.5,
              "img_url": "https://firebasestorage.googleapis.com/v0/b/sneaker-app-a434e.appspot.com/o/jordans5.png?alt=media&token=0bcb60f7-70b6-4bb1-b484-f5503829b2bd",
              "description":
                  "Follow in the footsteps of greatness. The all-time classic AJ1 design gets a makeover with fresh pops of colour and mixed materials"
            },
            {
              "product_Id": "3",
              "label": "Air Jordan",
              "price": 145,
              "rating": 4.5,
              "img_url": "https://firebasestorage.googleapis.com/v0/b/sneaker-app-a434e.appspot.com/o/nike1.png?alt=media&token=b3bc12d8-2273-49f9-910c-e3062a7ebe1a",
              "description":
                  "Follow in the footsteps of greatness. The all-time classic AJ1 design gets a makeover with fresh pops of colour and mixed materials"
            },
            {
              "product_Id": "4",
              "label": "Air Force",
              "price": 170,
              "rating": 4.5,
              "img_url": "https://firebasestorage.googleapis.com/v0/b/sneaker-app-a434e.appspot.com/o/af3.png?alt=media&token=c54fc94a-505c-458f-8d4c-6edc1cb2fce1",
              "description":
                  "Follow in the footsteps of greatness. The all-time classic AJ1 design gets a makeover with fresh pops of colour and mixed materials"
            },
            {
              "product_Id": "5",
              "label": "Air Force",
              "price": 135,
              "rating": 4.5,
              "img_url": "https://firebasestorage.googleapis.com/v0/b/sneaker-app-a434e.appspot.com/o/af1.png?alt=media&token=7519b846-4a47-437b-85a3-7d2abf342dd6",
              "description":
                  "Get back to the past with these coveted retros. Celebrating the '85 original, they bring back the shape that started the off-court revolution. With classic details and throwback hoops flair, they let you channel vintage style back onto the streets. The padded, high-top collar means you can take your game anywhere—in comfort."
            },
            {
              "product_Id": "6",
              "label": "Air Force",
              "price": 105,
              "rating": 4.5,
              "img_url": "https://firebasestorage.googleapis.com/v0/b/sneaker-app-a434e.appspot.com/o/af2.png?alt=media&token=a7768b92-c20c-4fac-87f4-c48dfc48bb78",
              "description":
                  "Get back to the past with these coveted retros. Celebrating the '85 original, they bring back the shape that started the off-court revolution. With classic details and throwback hoops flair, they let you channel vintage style back onto the streets. The padded, high-top collar means you can take your game anywhere—in comfort."
            },
            {
              "product_Id": "7",
              "label": "Air Jordan",
              "price": 123,
              "img_url": "https://firebasestorage.googleapis.com/v0/b/sneaker-app-a434e.appspot.com/o/jordans3.png?alt=media&token=9524b6a6-739e-456f-993d-f47aba377e9a",
              "rating": 4.5,
              "description":
                  "Follow in the footsteps of greatness. The all-time classic AJ1 design gets a makeover with fresh pops of colour and mixed materials"
            }
          ]
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  delete(){
    users.doc("").delete();
  }

// final Map<String,dynamic> data ={
//               "product_Id": "1",
//               "label": "Air Jordan",
//               "price": 123,
//               "img_url": "",
//               "rating": 4.5,
//               "description":
//                   "Follow in the footsteps of greatness. The all-time classic AJ1 design gets a makeover with fresh pops of colour and mixed materials"
//              };
//   addProduct() {
//     return product.doc(data["product_Id"])
//         .set(

//             // {
//             //   "label": "Air Jordan",
//             //   "price": 340,
//             //   "img_url": "",
//             //   "description":
//             //       "Follow in the footsteps of greatness. The all-time classic AJ1 design gets a makeover with fresh pops of colour and mixed materials"
//             // },
//             // {
//             //   "label": "Air Jordan",
//             //   "price": 170,
//             //   "rating": 4.5,
//             //   "img_url": "",
//             //   "description":
//             //       "Follow in the footsteps of greatness. The all-time classic AJ1 design gets a makeover with fresh pops of colour and mixed materials"
//             // },
//             // {
//             //   "label": "Air Jordan",
//             //   "price": 113,
//             //   "rating": 4.5,
//             //   "img_url": "",
//             //   "description":
//             //       "Follow in the footsteps of greatness. The all-time classic AJ1 design gets a makeover with fresh pops of colour and mixed materials"
//             // },
//             // {
//             //   "label": "Air Jordan",
//             //   "price": 145,
//             //   "rating": 4.5,
//             //   "img_url": "",
//             //   "description":
//             //       "Follow in the footsteps of greatness. The all-time classic AJ1 design gets a makeover with fresh pops of colour and mixed materials"
//             // },
//             // {
//             //   "label": "Air Jordan",
//             //   "price": 170,
//             //   "rating": 4.5,
//             //   "img_url": "",
//             //   "description":
//             //       "Follow in the footsteps of greatness. The all-time classic AJ1 design gets a makeover with fresh pops of colour and mixed materials"
//             // },
//             // {
//             //   "label": "Air Force",
//             //   "price": 135,
//             //   "rating": 4.5,
//             //   "img_url": "",
//             //   "description":
//             //       "Get back to the past with these coveted retros. Celebrating the '85 original, they bring back the shape that started the off-court revolution. With classic details and throwback hoops flair, they let you channel vintage style back onto the streets. The padded, high-top collar means you can take your game anywhere—in comfort."
//             // },
//             // {
//             //   "label": "Air Force",
//             //   "price": 105,
//             //   "rating": 4.5,
//             //   "img_url": "",
//             //   "description":
//             //       "Get back to the past with these coveted retros. Celebrating the '85 original, they bring back the shape that started the off-court revolution. With classic details and throwback hoops flair, they let you channel vintage style back onto the streets. The padded, high-top collar means you can take your game anywhere—in comfort."
//             // }

//         )
//         .then((value) => print("Product added"))
//         .catchError((error) => print("Failed to add user: $error"));
//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepOrangeAccent,
        body: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  addProduct();
                },
                child: const Text("Here"))
          ],
        ));
  }
}
