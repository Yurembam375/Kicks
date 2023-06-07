import 'package:flutter/material.dart';

class TextfieldPage extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final Icon icon;

  const TextfieldPage(
      {super.key,
      required this.controller,
      required this.obscureText,
      required this.hintText,
      required this.icon,

      
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade400,)),
              fillColor: Colors.grey[200],
              filled: true,
          prefixIcon:icon,
          hintText: hintText,
          
        ),
      ),

    );
  }
}
