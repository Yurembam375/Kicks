import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
// Create a storage reference from our app
  final storageRef = FirebaseStorage.instance.ref();
//final Reference storageRef = FirebaseStorage.instance.ref();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: ElevatedButton(
          onPressed: () 
          {
          //  storageRef.child(
            
          //  );
          },
          child: const Text("Here"),
        ),
      ),
    );
  }
}
