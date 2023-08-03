import 'package:flutter/material.dart';
import 'package:sneaker_app/model/goole.dart';

class SquareTile extends StatelessWidget {
  final String imagePath;
  const SquareTile({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoogleAuth().singInWithGoogle();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 15,
        ),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(5),
            color: Colors.grey[200]),
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              height: 35,
              width: 35,
            ),
            const Text(
              "Sign In With Google",
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
