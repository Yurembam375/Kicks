import 'package:flutter/material.dart';

class FavBotton extends StatefulWidget {
  const FavBotton({super.key});

  @override
  _FavBottonState createState() => _FavBottonState();
}

class _FavBottonState extends State<FavBotton> {
  bool isPressed = true;
  bool isPressed2 = true;
  bool isHighlighted = true;

  @override
  Widget build(BuildContext context) {
    return InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onHighlightChanged: (value) {
                setState(() {
                  isHighlighted = !isHighlighted;
                });
              },
              onTap: () {
                setState(() {
                  isPressed2 = !isPressed2;
                });
              },
              child: isPressed2
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
