import 'package:flutter/material.dart';


class PasswordTextfield extends StatefulWidget {
  final  controller;
  final String hintText;
  final icon;

  const PasswordTextfield(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.icon,

      
      });

  @override
  State<PasswordTextfield> createState() => _PasswordTextfieldState();
}

class _PasswordTextfieldState extends State<PasswordTextfield> {

  bool obscureText = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        controller: widget.controller,
        obscureText: !obscureText,
        decoration: InputDecoration(
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade400,)),
              fillColor: Colors.grey[200],
              filled: true,
          prefixIcon:widget.icon,
          hintText: widget.hintText,
            suffixIcon:obscureText? IconButton(
                    onPressed: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                    icon: const Icon(Icons.visibility,color: Colors.black,)):
                    IconButton(
                      onPressed:() {
                        setState(() {
                             obscureText = !obscureText;
                        });
                      },
                      icon: const Icon(Icons.visibility_off,color: Colors.black,)),
        ),
      ),

    );
  }
}
