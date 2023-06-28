import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String label;
  final String imageUrl;
  final String price;
  final bool is_favorite;
  final String brand;

  final VoidCallback onPressed;

  const ProductCard(
      {super.key,
      required this.label,
      required this.price,
      // ignore: non_constant_identifier_names
      required this.is_favorite,
      required this.imageUrl,
      required this.onPressed,
      required this.brand});
  @override
  Widget build(BuildContext context) {
    return card();
  }

  Container card() {
    return Container(
      height: 150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[100],
          border: Border.all(color: Colors.grey.withOpacity(0.5))),
      child: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    //const Text("Addidas",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                    InkWell(
                      onTap: onPressed,
                      child: is_favorite
                          ? Icon(
                              Icons.favorite,
                              color: Colors.pink.withOpacity(1.0),
                              size: 20,
                            )
                          : Icon(
                              Icons.favorite_border,
                              color: Colors.black.withOpacity(0.4),
                              size: 20,
                            ),
                    ),
                  ],
                ),
              ),
              CachedNetworkImage(
                imageUrl: imageUrl,
                width: 180,
                height: 90,
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      brand,
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 3),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  children: [
                    Text("₹$price",
                        style:
                            const TextStyle(color: Colors.black, fontSize: 11)),
                    Text(
                      "  ₹$price",
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 11,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    Text(
                      " (20% OFF)",
                      style: TextStyle(
                        color: Colors.redAccent.withOpacity(0.8),
                        fontSize: 10,
                      ),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
