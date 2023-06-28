
import 'package:flutter/material.dart';

class SizeWidget extends StatefulWidget {
  const SizeWidget({super.key});

  @override
  State<SizeWidget> createState() => _SizeWidgetState();
}

int tabindex = 0;
class _SizeWidgetState extends State<SizeWidget> {
  @override
  Widget build(BuildContext context) {
    
    List size = [6, 7, 8, 9, 10, 11, 12];
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: size.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          
          onTap: () {
            setState(() {
              tabindex = index;
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(3),
            child: Container(
              height: 36,
              width: 36,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: index == tabindex ? Colors.black : Colors.white,
                  border: Border.all(color: Colors.black)),
              child: Center(
                child: Text(
                  size[index].toString(),
                  style: TextStyle(color:index == tabindex ? Colors.white : Colors.black, ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
