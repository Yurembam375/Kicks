
import 'package:flutter/material.dart';

class FavBotton extends StatefulWidget { 
    const FavBotton({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FavBottonState createState() => _FavBottonState();
}

class _FavBottonState extends State<FavBotton> {
  bool isPressed = true;
  bool isHighlighted = true;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        setState(() {
          isPressed = !isPressed;
        });
      },
      child: isPressed
          ? Icon(
              Icons.favorite_border,
              color: Colors.black.withOpacity(0.6),
              size: 20,
            )
          : Icon(
              Icons.favorite,
              color: Colors.pink.withOpacity(1.0),
              size: 20,
            ),
    );
  }
}
